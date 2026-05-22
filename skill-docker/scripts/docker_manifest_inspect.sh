#!/bin/bash
#
# MIT No Attribution
#
# https://github.com/lentiancn/skills/blob/main/LICENSE
#
set -euo pipefail

# Arguments
DOCKER_IMAGE="${1:-}"
DOCKER_TAG="${2:-}"

# Validate required arguments
if [ -z "$DOCKER_IMAGE" ]; then
    echo "ERROR: DOCKER_IMAGE is required. Usage: $0 <DOCKER_IMAGE> <DOCKER_TAG>"
    exit 1
fi
if [ -z "$DOCKER_TAG" ]; then
    echo "ERROR: DOCKER_TAG is required. Usage: $0 <DOCKER_IMAGE> <DOCKER_TAG>"
    exit 1
fi

IMAGE_TAG="${DOCKER_IMAGE}:${DOCKER_TAG}"

# Inspect manifest (multi-arch metadata + layer digests/sizes); fails if image not found/auth error/network issue
MANIFEST_JSON=$(docker manifest inspect "${IMAGE_TAG}" 2>&1) || true
if echo "$MANIFEST_JSON" | grep -q "no such manifest"; then
  jq -n \
    --arg image "$DOCKER_IMAGE" \
    --arg tag "$DOCKER_TAG" \
    '{
        image: $image,
        tags: [
            {
                tag: $tag,
                exists: false,
                archs: {}
            }
        ]
    }'
  exit 0
fi
if echo "$MANIFEST_JSON" | grep -qi "unauthorized"; then
  echo "ERROR: authentication required or ${IMAGE_TAG} not found"
  exit 1
fi

# Determine if this is a Manifest List (has "manifests" field) or a single Manifest
IS_LIST=$(echo "$MANIFEST_JSON" | jq -r 'has("manifests")')

if [ "$IS_LIST" = "true" ]; then
    # For manifest list: extract arch/os/variant as key and size/digest as value
    ARCHS_JSON=$(echo "$MANIFEST_JSON" | jq '
        .manifests
        | map({
            key: (.platform.os + "/" + .platform.architecture + ("/" + (.platform.variant // "")))
                 | rtrimstr("/"),
            value: { size: .size, digest: .digest }
          })
        | from_entries
    ')
else
    # For single manifest: extract os/architecture/variant directly
    ARCHS_JSON=$(echo "$MANIFEST_JSON" | jq '
        {
          (.os + "/" + .architecture + ("/" + (.variant // "")))
          | rtrimstr("/"): {
            size: .size,
            digest: .digest
          }
        }
    ')
fi

# Output: { image, tags: [{ tag, exists, archs }] }
echo "$MANIFEST_JSON" | jq -n \
    --arg image "$DOCKER_IMAGE" \
    --arg tag "$DOCKER_TAG" \
    --argjson archs "$ARCHS_JSON" \
    '{
        image: $image,
        tags: [
            {
                tag: $tag,
                exists: true,
                archs: $archs
            }
        ]
    }'