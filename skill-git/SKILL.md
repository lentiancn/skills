---
name: skill-git
description: Clone or update a git repository to a local path
---

# git: interface 1 - clone or update

```bash
res=$(bash scripts/git_clone_or_update.sh <GIT_REMOTE_URL> [GIT_BRANCH] <GIT_LOCAL_PATH>)
```

## Input value

- `<GIT_REMOTE_URL>`: Required, remote git repository address
- `[GIT_BRANCH]`: Optional, target branch, default main
- `<GIT_LOCAL_PATH>`: Required, local storage directory

## Return value (res=stdout)

**Success:**

- `SUCCESS: Git clone`
- `SUCCESS: Git update`

**Error:**

- `ERROR: GIT_REMOTE_URL is required...`
- `ERROR: GIT_LOCAL_PATH is required...`
- `ERROR: Failed to enter directory...`

---

# More skills: https://github.com/lentiancn/skills
