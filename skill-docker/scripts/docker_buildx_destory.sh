#!/bin/bash
#
# MIT No Attribution
#
# https://github.com/lentiancn/skills/blob/main/LICENSE
#
set -euo pipefail

# Arguments
BUILDER_NAME="${1:-}"

# Remove the specified buildx builder instance if it exists
docker buildx rm "$BUILDER_NAME" 2>/dev/null || true

# Clean up all cached buildx resources system-wide
docker buildx prune -a -f 2>/dev/null || true

echo "Buildx builder '$BUILDER_NAME' destroyed and caches cleaned"
