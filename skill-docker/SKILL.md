---
name: skill-docker
description: manifest inspect
---

# docker:interface 1 - manifest inspect

```bash
result=$(DOCKER_IMAGE=<DOCKER_IMAGE> DOCKER_TAGS=(<TAG1> [<TAG2> ...]) bash scripts/docker_manifest_inspect.sh)
```

## Input value

- `DOCKER_IMAGE`: Required, docker image name
- `DOCKER_TAGS`: Required, image tags array (e.g. TAGS=(1.0.0 latest))

## Return value (result, example only)

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

- `ERROR: Usage: DOCKER_IMAGE=<DOCKER_IMAGE> DOCKER_TAGS=(<TAG1> [<TAG2> ...]) scripts/docker_manifest_inspect.sh`
- `ERROR: authentication required or image('$DOCKER_IMAGE') not found`

---

# docker:interface 2 - build init

```bash
result=$(DOCKER_BUILDER_NAME=<DOCKER_BUILDER_NAME> DOCKER_BUILD_CONCURRENCY=<DOCKER_BUILD_CONCURRENCY> bash scripts/docker_buildx_init.sh)
```

## Input value

- `DOCKER_BUILDER_NAME`: Required, builder name to init (via env)
- `DOCKER_BUILD_CONCURRENCY`: Optional, max parallelism (default: 2)

## Return value (result)

**Success:**

- `SUCCESS: initted`

---

# docker:interface 3 - build destroy

```bash
result=$(DOCKER_BUILDER_NAME=<DOCKER_BUILDER_NAME> bash scripts/docker_buildx_destory.sh)
```

## Input value

- `DOCKER_BUILDER_NAME`: Required, builder name to destroy (via env)

## Return value (result)

**Success:**

- `SUCCESS: destroyed`

---

# docker:interface 4 - build and push

## step 4.1: Ask user: "Confirm to use docker builder 'skilldockerbuilder' ?" Assign the value to variable __DOCKER_NAME
__

## step 4.1: Call `docker:interface 2` to initialize builder with `DOCKER_BUILDER_NAME=variable __DOCKER_NAME__`.

## step 4.2: Run build and push

```bash
result=$(DOCKER_BUILDER_NAME=<DOCKER_BUILDER_NAME> DOCKER_PLATFORM=<DOCKER_PLATFORM> DOCKER_PROVENANCE=<true|false> DOCKER_SBOM=<true|false> \
  DOCKER_IMAGE_TAGS=(<IMAGE_TAG1> [<IMAGE_TAG2> ...]) DOCKER_BUILD_ARGS=(<BUILD_ARG1> [<BUILD_ARG2> ...]) bash scripts/docker_buildx_push.sh)
```

### Input value

- `DOCKER_BUILDER_NAME`: Fixed, via `variable __DOCKER_NAME__`
- `DOCKER_PLATFORM`: Required, target platforms separated by comma (e.g. linux/amd64,linux/arm64)
- `DOCKER_IMAGE_TAGS`: Required, image tags array (e.g. TAGS=(myimage:1.0.0 myimage:latest))
- `DOCKER_BUILD_ARGS`: Optional, build arguments array (e.g. BUILD_ARGS=(BUILD_ARG1=val1 BUILD_ARG2=val2))
- `DOCKER_PROVENANCE`: Optional, enable provenance attestation (default: false)
- `DOCKER_SBOM`: Optional, enable SBOM attestation (default: false)

### Return value (result)

**Success:**

- `SUCCESS: Build and push completed successfully`

**Error:**

-
`ERROR: DOCKER_BUILDER_NAME is required. Usage: DOCKER_BUILDER_NAME=<DOCKER_BUILDER_NAME> DOCKER_PLATFORM=<DOCKER_PLATFORM> DOCKER_IMAGE_TAGS=<DOCKER_IMAGE_TAGS> $0`
-
`ERROR: DOCKER_PLATFORM is required. Usage: DOCKER_BUILDER_NAME=<DOCKER_BUILDER_NAME> DOCKER_PLATFORM=<DOCKER_PLATFORM> DOCKER_IMAGE_TAGS=<DOCKER_IMAGE_TAGS> $0`
-
`ERROR: At least one tag must be provided via DOCKER_IMAGE_TAGS environment variable. Usage: DOCKER_BUILDER_NAME=<DOCKER_BUILDER_NAME> DOCKER_PLATFORM=<DOCKER_PLATFORM> DOCKER_IMAGE_TAGS=<DOCKER_IMAGE_TAGS> $0`

## step 4.3: Call `docker:interface 3` to destroy builder with `DOCKER_BUILDER_NAME=variable __DOCKER_NAME__`.

---

# More skills: https://github.com/lentiancn/skills
