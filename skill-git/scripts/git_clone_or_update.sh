#!/bin/bash
#
# MIT No Attribution
#
# https://github.com/lentiancn/skills/blob/main/LICENSE
#
set -euo pipefail

GIT_REMOTE_URL="$1"
GIT_BRANCH="$2"
GIT_LOCAL_PATH="$3"

if [ -z "$GIT_REMOTE_URL" ]; then
    echo "ERROR: GIT_REMOTE_URL is required. Usage: $0 <GIT_REMOTE_URL> [GIT_BRANCH] <GIT_LOCAL_PATH>"
    exit 1
fi
if [ -z "$GIT_LOCAL_PATH" ]; then
    echo "ERROR: GIT_LOCAL_PATH is required. Usage: $0 <GIT_REMOTE_URL> [GIT_BRANCH> <GIT_LOCAL_PATH>"
    exit 1
fi

GIT_BRANCH=${GIT_BRANCH:-main}

if [ -d "${GIT_LOCAL_PATH}" ]; then
    cd "${GIT_LOCAL_PATH}" || {
        echo "ERROR: Failed to enter directory ${GIT_LOCAL_PATH}. Check: $0"
        exit 1
    }
    git fetch origin "${GIT_BRANCH}"
    git pull origin "${GIT_BRANCH}"
    echo "SUCCESS: Git update"
else
    PARENT_DIR=$(dirname "${GIT_LOCAL_PATH}")
    mkdir -p "${PARENT_DIR}"
    cd "${PARENT_DIR}" || exit
    git clone -b "${GIT_BRANCH}" "${GIT_REMOTE_URL}" "${GIT_LOCAL_PATH}"
    echo "SUCCESS: Git clone"
fi
