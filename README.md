# secure-iac-containers

Hardened, network-isolated container sandbox, as Terraform and Docker Compose (Podman-compatible).

Hardening: non-root user, read-only rootfs, all capabilities dropped, `no-new-privileges`, memory/PID limits, internal network (no egress).

```bash
# Terraform
cd terraform && terraform init && terraform apply
# Compose (Docker or Podman)
docker compose up -d     # or: podman-compose up -d
```

License: MIT
