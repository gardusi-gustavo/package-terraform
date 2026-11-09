# Usage

```bash
terraform fmt -check -recursive && bash infra/scripts/ci.sh
```

Use a module with `source = "git::https://github.com/gardusi-gustavo/package-terraform.git//modules/aws/s3-bucket?ref=v0.1.0"`.

Reference topologies live under `examples/`. They are validate-only and are never applied by CI.
