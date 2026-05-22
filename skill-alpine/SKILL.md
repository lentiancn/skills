---
name: skill-alpine
description: Get Alpine Linux latest releases including version, architectures and download URLs; Aggregate alpine latest version archs
---

# alpine:interface 1 - Get latest releases

```bash
latest_releases_json=$(bash scripts/alpine_fetch_latest_releases.sh)
```

## Return value (latest_releases_json=stdout, example only)

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

# alpine:interface 2 - Aggregate latest version archs

```bash
latest_version_archs_json=$(bash scripts/alpine_aggregate_latest_version_archs.sh)
```

## Return value (latest_version_archs_json=stdout, example only)

```json
[
  {
    "version": "3.23.4",
    "archs": [
      "aarch64",
      "armhf",
      "armv7",
      "loongarch64",
      "ppc64le",
      "riscv64",
      "s390x",
      "x86",
      "x86_64"
    ]
  }
]
```

---

# More skills: https://github.com/lentiancn/skills
