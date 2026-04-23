# aws-tf-lab

Laboratório pessoal de estudo de AWS via Terraform. Cada `day-NN-<recurso>/` é um exercício independente com backend remoto.

## Estrutura

```
_bootstrap/   → cria S3 (state) + DynamoDB (lock) — rodar uma vez
_modules/     → módulos extraídos dos exercícios
_shared/      → provider, versions e locals copiados para cada day-NN
day-NN-*/     → um exercício por dia
```

## Setup inicial

```bash
cd _bootstrap
terraform init
terraform apply
```

Depois copie os outputs para `_shared/backend.tf.tpl`.

## Começar um novo dia

```bash
make new DAY=07 NAME=nat-gateway
# editar day-07-nat-gateway/ e implementar
make init   DAY=07 NAME=nat-gateway
make apply  DAY=07 NAME=nat-gateway
make destroy DAY=07 NAME=nat-gateway
```

## Convenções

- `terraform destroy` sempre ao final do dia para evitar custo.
- Commit por dia: `git commit -m "day-NN: <recurso>"`.
- Variáveis sensíveis em `terraform.tfvars` (ignorado pelo git).
