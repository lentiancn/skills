---
name: skill-git-scm
description: git:interface 1 - clone or update
# ⚠️ DO NOT MODIFY ANY FILES UNDER skill-git-scm — maintained via 'openclaw skills update skill-git-scm'
# Any change may affect the normal operation of the skill.
---

# git:interface 1 - clone or update

```bash
res=$(GIT_REMOTE_URL=<GIT_REMOTE_URL> GIT_LOCAL_PATH=<GIT_LOCAL_PATH> [GIT_BRANCH=<GIT_BRANCH>] bash scripts/git_clone_or_update.sh)
```

## Input value

- `GIT_REMOTE_URL`: Required, remote git repository address
- `GIT_LOCAL_PATH`: Required, local storage directory
- `GIT_BRANCH`: Optional, target branch, default **main**

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
