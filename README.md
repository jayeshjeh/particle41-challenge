Simple Time Service & Infrastructure

This repository contains a minimalist JSON time microservice and Terraform configuration to deploy it to AWS ECS (Fargate).

Project structure

- `app/` — Python Flask application and Dockerfile
- `terraform/` — Infrastructure as Code (VPC, ALB, ECS)

---

## Part 1 — Running locally (Docker)

Build the application image and run it locally for testing.

Build the image:

```bash
cd app
docker build -t simpletimeservice:latest .
```

Run the container (exposes port 5000):

```bash
docker run -p 5000:5000 simpletimeservice:latest
```

Verify the service is responding:

```bash
curl http://localhost:5000
```

Example JSON response:

```json
{"timestamp": "2023-12-12T10:00:00.000Z", "ip": "172.17.0.1"}
```

---

## Part 2 — Deploying to AWS (Terraform)

The Terraform configuration provisions a VPC, an Application Load Balancer (ALB), and ECS (Fargate) tasks running in private subnets.

### Configure AWS credentials

Set environment variables so Terraform can authenticate with AWS.

Linux / macOS:

```bash
export AWS_ACCESS_KEY_ID="your_access_key"
export AWS_SECRET_ACCESS_KEY="your_secret_key"
export AWS_REGION="us-east-1"
```

Windows (PowerShell):

```powershell
$Env:AWS_ACCESS_KEY_ID="your_access_key"
$Env:AWS_SECRET_ACCESS_KEY="your_secret_key"
$Env:AWS_REGION="us-east-1"
```

### Initialize and apply

```bash
cd terraform
terraform init
terraform apply -var="container_image=docker.io/yourusername/simpletimeservice:latest"
```

Review the plan and confirm by typing `yes` when prompted. After a successful apply, Terraform will output the ALB DNS name (`alb_dns_name`).

### Cleanup

Destroy the created resources when no longer needed to avoid charges:

```bash
terraform destroy
```

---

## Notes for reviewers

- **Security:** The container runs as a non-root user (`appuser`).
- **Network:** The ALB is deployed in public subnets; ECS tasks run in private subnets.
- **CI/CD:** A GitHub Actions workflow is available in `.github/workflows` for automated builds and deployments.

---

## Optional additions

If desired, I can add the following to the repository:

- A `Makefile` with common build/deploy targets
- A `docker-compose.yml` example for local development

---

Directories of interest: `app/`, `terraform/`
