#!/bin/bash
#
# MIT No Attribution
#
# https://github.com/lentiancn/skills/blob/main/LICENSE
#
set -eux

ALPINE_RELEASE_BASE_URL="https://dl-cdn.alpinelinux.org/alpine/latest-stable/releases"

archs=$(
    curl -s "$ALPINE_RELEASE_BASE_URL/" \
    | grep -oE 'href="[^"]+/"' \
    | sed 's/href="\([^"]*\)\/"/\1/' \
    | grep -v '^\.\.$' \
    | sort
)

first_arch_json=1
archs_json=""

for arch in $archs; do
    latest_releases_yaml_url="${ALPINE_RELEASE_BASE_URL}/${arch}/latest-releases.yaml"
    latest_releases_yaml=$(curl -s --connect-timeout 60 --max-time 120 "$latest_releases_yaml_url")

    release_file_name=$(echo "$latest_releases_yaml" | yq -r '.[] | select(.flavor == "alpine-minirootfs") | .file')
    release_version=$(echo "$latest_releases_yaml" | yq -r '.[] | select(.flavor == "alpine-minirootfs") | .version')

    [ -z "$release_file_name" ] || [ -z "$release_version" ] && continue

    release_file_url="${ALPINE_RELEASE_BASE_URL}/${arch}/${release_file_name}"

    arch_json="{\"version\":\"${release_version}\",\"arch\":\"${arch}\",\"file_url\":\"${release_file_url}\"}"

    if [ $first_arch_json -eq 1 ]; then
        archs_json="$arch_json"
        first_arch_json=0
    else
        archs_json="${archs_json},${arch_json}"
    fi
done

echo "[${archs_json}]"
