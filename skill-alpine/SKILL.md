---
name: skill-alpine
description: Get Alpine Linux latest release including version, architectures and download URLs. Trigger when checking Alpine version
---

# alpine: interface 1 - Get latest releases of Alpine Linux

```bash
latest_releases_json=$(bash scripts/fetch_latest_releases.sh)
```

## Return value (JSON stdout, example)

```json
[
  {
    "version": "3.23.4",
    "arch": "x86_64",
    "file_url": "https://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/x86_64/alpine-minirootfs-3.23.4-x86_64.tar.gz"
  },
  {
    "version": "3.23.4",
    "arch": "aarch64",
    "file_url": "https://dl-cdn.alpinelinux.org/alpine/latest-stable/releases/aarch64/alpine-minirootfs-3.23.4-aarch64.tar.gz"
  }
]
```

---

# More skills: https://github.com/lentiancn/skills
