# aws-tf-lab

Hands-on AWS study lab — provisioning services exclusively via Terraform, one exercise per day.

Each `day-NN-<resource>/` is a self-contained exercise with its own state. No AWS Console, no AWS CLI for resource creation — Terraform only.

## Structure

```
_bootstrap/   → creates S3 (state) + DynamoDB (lock) — run once (optional)
_modules/     → reusable modules extracted from exercises
_shared/      → provider, versions and locals copied into each day-NN
day-NN-*/     → one independent exercise per day
```

## Getting started

```bash
# Start a new day
make new DAY=02 NAME=nat-gateway

# Work the exercise
make init   DAY=02 NAME=nat-gateway
make plan   DAY=02 NAME=nat-gateway
make apply  DAY=02 NAME=nat-gateway

# Always destroy at the end to avoid costs
make destroy DAY=02 NAME=nat-gateway
```

## Study plan

10 weeks covering: IAM → VPC → Compute → Storage → Databases → Messaging → Containers → Security → Observability → Capstone.

## Conventions

- `terraform destroy` at the end of every session — no leftover costs.
- One commit per day: `git commit -m "day-NN: <resource>"`.
- Sensitive values go in `terraform.tfvars` (gitignored).
- No hardcoded values — variables and outputs always.
