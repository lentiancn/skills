---
name: skill-docker
description: manifest inspect
---

# docker:interface 1 - manifest inspect

```bash
manifest_json=$(bash scripts/docker_manifest_inspect.sh <DOCKER_IMAGE> <DOCKER_TAG1> [DOCKER_TAG2 ...])
```

## Input value

- `DOCKER_IMAGE`: Required, remote git repository address
- `DOCKER_TAG*`: Required, local storage directory

## Return value (manifest_json=stdout, example only)

**Success:**

```json
{
  "image": "debian",
  "tags": [
    {
      "tag": "latest",
      "exists": true,
      "archs": {
      }
    },
    {
      "tag": "latest",
      "exists": true,
      "archs": {
        "linux/amd64": {
          "size": 1021,
          "digest": "sha256:2477d9ee0ead4370c778ce3aa42258a0b07684d1a84ded8f4af518383fbc3f2d"
        },
        "linux/arm/v5": {
          "size": 1037,
          "digest": "sha256:87830995eed0e62e9d1aa5360345611d29b343ce532bfce499d9342f33d41076"
        },
        "linux/arm/v7": {
          "size": 1037,
          "digest": "sha256:dc071dceb8d8c47d9496e56aa149fb8d13cd73af3bde779df7dbaece27eec510"
        },
        "linux/arm64/v8": {
          "size": 1041,
          "digest": "sha256:b1e30180b5678df3c17d6b0e659f7107ae4c299506e97427a9373640804db927"
        },
        "linux/386": {
          "size": 1017,
          "digest": "sha256:804a514efd1d29653f3994230b23af636427967819f18d34ac02301e1ebb3944"
        },
        "linux/ppc64le": {
          "size": 1025,
          "digest": "sha256:df3512fd9c128f0344a2e4db3b42c66d71ecb62295c24463f4ae851350efd14e"
        },
        "linux/riscv64": {
          "size": 1025,
          "digest": "sha256:4f52ee6eaf425fa42ddfd7b871040a2bfd5411ce07801b6342ae57ba40c8cf5c"
        },
        "linux/s390x": {
          "size": 1021,
          "digest": "sha256:7c6b2cfbda75aa8ebddd4634addba1286dc3e7a41ed604041c3eae2de5746c9f"
        }
      }
    }
  ]
}
```

**Error:**

- `ERROR: Usage: scripts/docker_manifest_inspect.sh <DOCKER_IMAGE> <DOCKER_TAG1> [DOCKER_TAG2 ...]`
- `ERROR: authentication required or image('$DOCKER_IMAGE') not found`

---

# More skills: https://github.com/lentiancn/skills
