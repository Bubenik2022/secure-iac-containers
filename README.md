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

## Disclaimer
Provided for educational and defensive purposes only, as-is and without warranty. Use only on systems and accounts you own or are explicitly authorized to manage. Review and test in a non-production environment before use.
