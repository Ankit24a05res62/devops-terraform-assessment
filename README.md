# DevOps Assessment: Terraform + Database Reliability

This repository contains the solution for the DevOps assessment, focusing on modular AWS infrastructure provisioning via Terraform and Database Reliability using PostgreSQL.

##  Part 1-3: Terraform Infrastructure & CI/CD

The infrastructure code is designed to provision a secure AWS environment (VPC, ALB, ECS Fargate, and RDS). Actual deployment is not required, but the code is fully validated.

* **Modular Approach:** Reusable modules are located in `infra/modules/` (`network`, `ecs`, `rds`).
* **Multi-Environment Setup:** `infra/envs/dev` and `infra/envs/prod` utilize the modules with distinct variables. Production uses a larger instance size, longer backup retention, and strict deletion protection.
* **CI/CD Pipeline:** A GitHub Actions workflow (`.github/workflows/terraform.yml`) is configured to automatically run `terraform fmt`, `init`, `validate`, and `plan` on PRs and pushes to the `main` branch. 

##  Part 4-5: Local Database & Query Optimization

The database tasks are containerized using Docker Compose.

### Setup Instructions
1. Ensure Docker and Docker Compose are installed.
2. Run the following command in the root directory:
   ```bash
   docker compose up -d
