# package-terraform

Pure HCL infrastructure modules and reference blueprints. No state, no credentials, no apply step.

## Layout

| Path | Holds |
| --- | --- |
| `modules/aws/` | AWS modules |
| `modules/gcp/` | GCP modules |
| `modules/cloudflare/` | Cloudflare modules |
| `examples/` | reference topologies |
| `tests/` | validation notes |

## Build

```bash
terraform fmt -check -recursive && bash infra/scripts/ci.sh
```

## Use

```bash
Use a module with `source = "git::https://github.com/gardusi-gustavo/package-terraform.git//modules/aws/s3-bucket?ref=v0.1.0"`.
```
