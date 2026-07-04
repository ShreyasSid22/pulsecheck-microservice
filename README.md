# PulseCheck - Cloud-Native Health Monitoring Microservice

<p align="center">

![Python](https://img.shields.io/badge/Python-3.14-blue?style=for-the-badge&logo=python)
![Flask](https://img.shields.io/badge/Flask-3.1-black?style=for-the-badge&logo=flask)
![Docker](https://img.shields.io/badge/Docker-Containerized-2496ED?style=for-the-badge&logo=docker)
![Terraform](https://img.shields.io/badge/Terraform-IaC-623CE4?style=for-the-badge&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-orange?style=for-the-badge&logo=amazonaws)
![Amazon ECS](https://img.shields.io/badge/Amazon-ECS-FF9900?style=for-the-badge&logo=amazon-ecs)
![Jenkins](https://img.shields.io/badge/Jenkins-CI/CD-D24939?style=for-the-badge&logo=jenkins)
![CloudWatch](https://img.shields.io/badge/Amazon-CloudWatch-FF4F8B?style=for-the-badge&logo=amazoncloudwatch)

</p>

---

# Project Overview

PulseCheck is a cloud-native health monitoring microservice developed to demonstrate a complete DevOps implementation using modern cloud engineering practices. The project automates the entire software delivery lifecycle—from source code management and automated testing to containerization, infrastructure provisioning, and deployment on Amazon Web Services (AWS).

The application is built using **Python** and **Flask**, containerized with **Docker**, and deployed on **Amazon ECS Fargate** behind an **Application Load Balancer (ALB)**. Infrastructure is provisioned using **Terraform**, while **Jenkins** orchestrates the Continuous Integration and Continuous Deployment (CI/CD) pipeline.

The objective of this project is to showcase how Infrastructure as Code (IaC), containerization, cloud services, and CI/CD automation work together to deliver applications reliably, consistently, and with minimal manual intervention.

This repository reflects a production-oriented deployment workflow and follows DevOps best practices for automation, repeatability, scalability, and maintainability.

---

# Project Objectives

The primary objectives of this project are:

- Provision AWS infrastructure using Terraform.
- Containerize the application using Docker.
- Implement a complete Jenkins CI/CD pipeline.
- Store Docker images securely in Amazon Elastic Container Registry (ECR).
- Deploy containerized workloads on Amazon ECS Fargate.
- Expose the application through an Application Load Balancer.
- Centralize application logging using Amazon CloudWatch.
- Demonstrate Infrastructure as Code and Continuous Deployment principles.
- Build a repeatable deployment process that requires minimal manual intervention.

---

# Key Features

## Application

- RESTful microservice built with Python Flask
- Health monitoring endpoint (`/health`)
- JSON-based API responses
- Automated unit testing using Pytest

## Containerization

- Dockerized application
- Lightweight Python runtime
- Consistent deployments across development and production environments

## Infrastructure as Code

- Complete AWS infrastructure managed with Terraform
- Modular Terraform configuration
- Remote Terraform state stored in Amazon S3

## CI/CD

- Jenkins Declarative Pipeline
- Automated testing
- Docker image creation
- Docker image publishing to Amazon ECR
- Infrastructure deployment using Terraform
- Automated deployment to Amazon ECS

## AWS Services

- Amazon VPC
- Public Subnets
- Internet Gateway
- Route Tables
- Security Groups
- IAM Roles
- Amazon ECS Fargate
- Amazon ECR
- Application Load Balancer
- Amazon CloudWatch

---

# High-Level Architecture

```text
                              Developer
                                  │
                           Git Push to GitHub
                                  │
                                  ▼
                          GitHub Repository
                                  │
                                  ▼
                              Jenkins CI/CD
                                  │
        ┌─────────────────────────┼─────────────────────────┐
        │                         │                         │
   Checkout Code           Run Unit Tests          Build Docker Image
                                                        │
                                                        ▼
                                            Push Image to Amazon ECR
                                                        │
                                                        ▼
                                            Terraform Infrastructure
                                                        │
                   ┌────────────────────────────────────┼────────────────────────────────────┐
                   │                                    │                                    │
                  VPC                            Security Groups                         IAM Roles
                   │
                   ▼
         Application Load Balancer
                   │
                   ▼
           Amazon ECS Fargate
                   │
                   ▼
     PulseCheck Flask Microservice Container
                   │
                   ▼
        Amazon CloudWatch Logs & Metrics
```

---

# CI/CD Workflow

```text
Developer
    │
    ▼
Git Push
    │
    ▼
GitHub Repository
    │
    ▼
Jenkins Pipeline
    │
    ├── Checkout Source Code
    ├── Install Dependencies
    ├── Execute Unit Tests
    ├── Build Docker Image
    ├── Push Docker Image to Amazon ECR
    ├── Terraform Init
    ├── Terraform Validate
    ├── Terraform Plan
    ├── Terraform Apply
    └── Trigger ECS Rolling Deployment
    │
    ▼
Amazon ECS Fargate
    │
    ▼
Application Load Balancer
    │
    ▼
End Users
```

---

# Repository Highlights

This project demonstrates practical implementation of:

- Infrastructure as Code (Terraform)
- Continuous Integration and Continuous Deployment (Jenkins)
- Containerization using Docker
- AWS Cloud Infrastructure
- Amazon ECS Fargate
- Amazon ECR
- Application Load Balancer
- Cloud-native application deployment
- Automated infrastructure provisioning
- Remote Terraform state management
- Centralized application monitoring using Amazon CloudWatch

---

> **Project Status:** Completed and Fully Functional

The application is successfully deployed on **Amazon ECS Fargate**, fronted by an **Application Load Balancer**, with infrastructure provisioned using **Terraform** and deployments automated through a **Jenkins CI/CD pipeline**.

# Technology Stack

| Category | Technology | Purpose |
|----------|------------|---------|
| Programming Language | Python 3.14 | Application development |
| Web Framework | Flask | REST API development |
| Testing Framework | Pytest | Unit testing |
| Containerization | Docker | Package application and dependencies |
| Source Control | Git | Version control |
| Repository Hosting | GitHub | Source code management |
| CI/CD | Jenkins | Continuous Integration & Continuous Deployment |
| Infrastructure as Code | Terraform | AWS infrastructure provisioning |
| Cloud Provider | Amazon Web Services (AWS) | Cloud infrastructure |
| Container Registry | Amazon Elastic Container Registry (ECR) | Docker image storage |
| Container Orchestration | Amazon ECS Fargate | Serverless container execution |
| Load Balancer | Application Load Balancer (ALB) | Traffic distribution |
| Monitoring | Amazon CloudWatch | Logging and monitoring |

---

# AWS Services Used

The project uses multiple AWS services to build a scalable and production-oriented cloud-native application. Each service was selected based on its role within the overall architecture.

---

## Amazon VPC

The Virtual Private Cloud (VPC) provides an isolated networking environment where all AWS resources are deployed.

### Purpose

- Network isolation
- Custom IP addressing
- Secure communication between AWS resources

### Why VPC?

Using a dedicated VPC provides complete control over networking instead of relying on the default AWS network. This makes the infrastructure easier to secure and manage.

---

## Public Subnets

Two public subnets were created across different Availability Zones.

### Purpose

- High Availability
- Load Balancer placement
- Internet connectivity

### Why two subnets?

Application Load Balancers require at least two subnets in separate Availability Zones to provide fault tolerance and improved availability.

---

## Internet Gateway

The Internet Gateway enables communication between the VPC and the public internet.

### Purpose

- Outbound internet access
- Public access to the Application Load Balancer

---

## Security Groups

Security Groups act as virtual firewalls that control inbound and outbound traffic.

Separate Security Groups are used for:

- Application Load Balancer
- ECS Tasks

This ensures that only the Load Balancer can communicate directly with the application containers.

---

## IAM Roles

IAM Roles are used to grant AWS permissions securely.

The ECS Task Execution Role allows containers to:

- Pull Docker images from Amazon ECR
- Send application logs to Amazon CloudWatch

Using IAM Roles eliminates the need to store AWS credentials inside the application.

---

## Amazon Elastic Container Registry (ECR)

Amazon ECR is a fully managed Docker image registry.

### Purpose

- Store Docker images
- Version container images
- Integrate with Amazon ECS

### Why ECR?

- Native AWS integration
- Secure private repositories
- Image vulnerability scanning
- IAM-based authentication

---

## Amazon ECS Fargate

Amazon ECS Fargate is used to run Docker containers without managing EC2 instances.

### Purpose

- Run containerized workloads
- Eliminate server management
- Simplify deployments

### Why ECS Fargate?

For this project, Fargate was selected because it allows containers to run without provisioning or maintaining virtual machines. This reduces operational overhead while providing seamless integration with other AWS services.

---

## Application Load Balancer (ALB)

The Application Load Balancer routes incoming HTTP traffic to healthy ECS tasks.

### Responsibilities

- Health Checks
- Traffic Distribution
- High Availability
- Request Routing

The ALB continuously monitors application health using the `/health` endpoint before forwarding client requests.

---

## Amazon CloudWatch

Amazon CloudWatch provides centralized monitoring and logging.

### Purpose

- Store application logs
- Monitor ECS containers
- Simplify troubleshooting
- Support operational visibility

Container logs are automatically streamed from Amazon ECS to CloudWatch.

---

## Amazon S3

Amazon S3 is used as the remote backend for Terraform state.

### Purpose

- Centralized Terraform state storage
- Team collaboration
- State persistence

### Why Remote State?

A remote backend prevents multiple users from maintaining separate local state files and ensures infrastructure changes remain consistent across deployments.

---

# Project Directory Structure

```text
pulsecheck-microservice/
│
├── app/
│   ├── app.py
│   ├── requirements.txt
│   ├── test_app.py
│   └── venv/
│
├── terraform/
│   ├── provider.tf
│   ├── versions.tf
│   ├── variables.tf
│   ├── networking.tf
│   ├── security.tf
│   ├── iam.tf
│   ├── ecr.tf
│   ├── ecs.tf
│   ├── alb.tf
│   ├── cloudwatch.tf
│   ├── outputs.tf
│   └── terraform.tfvars
│
├── Dockerfile
├── docker-compose.yml
├── Jenkinsfile
├── .gitignore
├── .dockerignore
└── README.md
```

---

# Design Decisions

The following design choices were made during implementation:

### Why Terraform instead of CloudFormation?

Terraform was selected because:

- Provider independent
- Reusable modules
- Large community support
- Simple configuration language
- Easier state management
- Better portability across cloud providers

---

### Why ECS instead of Kubernetes?

Amazon ECS Fargate was chosen because:

- No Kubernetes control plane to manage
- Reduced operational complexity
- Faster deployment
- Native AWS integration
- Suitable for small and medium-sized microservices

---

### Why Jenkins?

Jenkins was selected because:

- Open-source
- Large plugin ecosystem
- Supports Pipeline as Code
- Easy GitHub integration
- Widely used in enterprise DevOps environments

---

### Why Docker?

Docker ensures that the application runs consistently across different environments by packaging the application, runtime, libraries, and dependencies into a single portable container image.
# Infrastructure as Code (Terraform)

Infrastructure provisioning for this project is fully automated using **Terraform**. Rather than manually creating AWS resources through the AWS Management Console, every infrastructure component is defined as code.

The infrastructure is modularized into multiple Terraform configuration files, making it easier to maintain, extend, and troubleshoot.

## Resources Provisioned

Terraform provisions the following AWS resources:

- Amazon VPC
- Public Subnets across multiple Availability Zones
- Internet Gateway
- Route Tables and Route Table Associations
- Security Groups
- IAM Roles and Policies
- Amazon Elastic Container Registry (ECR)
- Amazon ECS Cluster
- Amazon ECS Task Definition
- Amazon ECS Service
- Application Load Balancer
- Target Group
- Listener
- CloudWatch Log Group

This approach ensures that infrastructure can be recreated consistently across environments.

---

# Remote Terraform State

Terraform state is stored remotely in an **Amazon S3 bucket** instead of locally.

## Benefits

- Centralized state management
- Prevents state file loss
- Supports team collaboration
- Enables Jenkins and local development environments to share the same infrastructure state
- Eliminates configuration drift caused by multiple local state files

---

# Continuous Integration & Continuous Deployment

The project uses **Jenkins Declarative Pipeline** to automate the complete software delivery lifecycle.

The Jenkins pipeline can be triggered manually or integrated with GitHub webhooks to automatically execute whenever code is pushed to the GitHub repository.

The pipeline performs automated code checkout, dependency installation, unit testing, Docker image creation, image publishing to Amazon ECR, infrastructure validation using Terraform, and deployment to Amazon ECS Fargate.

## Pipeline Stages

### 1. Source Code Checkout

Jenkins clones the latest version of the project from GitHub.

---

### 2. Dependency Installation

A Python virtual environment is created and project dependencies are installed using:

- Flask
- Pytest

This ensures a clean and isolated build environment.

---

### 3. Unit Testing

Automated tests are executed using **Pytest**.

Only if all tests pass does the pipeline continue.

This prevents faulty code from being deployed.

---

### 4. Docker Image Build

A Docker image is built using the project's Dockerfile.

The image packages:

- Application source code
- Python runtime
- Dependencies
- Required libraries

This guarantees identical execution across environments.

---

### 5. Push Image to Amazon ECR

After a successful build, Jenkins authenticates with Amazon ECR and pushes the latest Docker image.

The ECS Task Definition references this image during deployment.

---

### 6. Terraform Initialization

Terraform initializes:

- AWS Provider
- S3 Backend
- State Configuration

This ensures Jenkins uses the shared infrastructure state.

---

### 7. Terraform Validation

Terraform validates all configuration files before deployment.

This helps detect syntax and configuration issues early in the pipeline.

---

### 8. Terraform Plan

Terraform compares the desired infrastructure against the existing AWS infrastructure.

If differences exist, the execution plan shows which resources will be created, modified, or removed.

---

### 9. Terraform Apply

Infrastructure changes are automatically applied.

If no infrastructure changes are required, Terraform reports:

```
No changes. Infrastructure matches the configuration.
```

---

### 10. Amazon ECS Deployment

Finally, Jenkins triggers a new deployment of the ECS service.

Amazon ECS launches new containers using the latest Docker image stored in Amazon ECR.

The Application Load Balancer performs health checks before routing production traffic to the updated containers.

---

# Deployment Workflow

```text
Developer
    │
    ▼
Git Push
    │
    ▼
GitHub Repository
    │
    ▼
Jenkins Pipeline
    │
    ├── Checkout Code
    ├── Install Dependencies
    ├── Run Unit Tests
    ├── Build Docker Image
    ├── Push Image to Amazon ECR
    ├── Terraform Init
    ├── Terraform Validate
    ├── Terraform Plan
    ├── Terraform Apply
    └── Force ECS Deployment
                │
                ▼
Amazon ECS Fargate
                │
                ▼
Application Load Balancer
                │
                ▼
Health Check (/health)
                │
                ▼
Users
```

---

# Application Endpoints

| Endpoint | Method | Description |
|-----------|--------|-------------|
| `/` | GET | Returns application information |
| `/health` | GET | Returns application health status |

Example response:

```json
{
  "hostname": "ip-10-0-1-131",
  "python_version": "3.14.6",
  "status": "healthy",
  "timestamp": "2026-07-04T02:16:14Z",
  "uptime_seconds": 158
}
```

---

# CI/CD Benefits

The automated pipeline provides several advantages:

- Eliminates manual deployment steps
- Ensures every deployment follows the same process
- Automatically validates infrastructure
- Detects application issues before deployment
- Provides faster and more reliable releases
- Reduces configuration inconsistencies
- Supports repeatable deployments across environments

---

# Build Verification

A successful deployment can be verified by:

- Jenkins pipeline completes successfully
- Docker image is available in Amazon ECR
- ECS service shows healthy running tasks
- Application Load Balancer health checks pass
- `/health` endpoint returns a healthy response
- CloudWatch logs display application logs

# Deployment Guide

This section describes the complete deployment workflow used to provision infrastructure and deploy the application.

## Prerequisites

Ensure the following tools are installed before starting the deployment:

| Tool | Version |
|------|---------|
| Git | Latest Stable Version |
| Docker | Latest Stable Version |
| Terraform | v1.15+ |
| AWS CLI | v2 |
| Python | 3.14 |
| Jenkins | LTS |
| AWS Account | Free Tier Supported |

---

## Clone the Repository

```bash
git clone https://github.com/ShreyasSid22/pulsecheck-microservice.git

cd pulsecheck-microservice
```

---

## Configure AWS Credentials

Configure AWS CLI using an IAM user with permissions for:

- Amazon ECS
- Amazon ECR
- Amazon VPC
- IAM
- CloudWatch
- S3
- Elastic Load Balancer

```bash
aws configure
```

Example:

```
AWS Access Key ID:
AWS Secret Access Key:
Region: ap-south-1
Output: json
```

---

## Deploy Infrastructure

Navigate to the Terraform directory.

```bash
cd terraform
```

Initialize Terraform.

```bash
terraform init
```

Validate the configuration.

```bash
terraform validate
```

Review the execution plan.

```bash
terraform plan
```

Provision the infrastructure.

```bash
terraform apply
```

---

## Build Docker Image

Return to the project root.

```bash
docker build -t pulsecheck:latest .
```

---

## Push Image to Amazon ECR

Authenticate Docker.

```bash
aws ecr get-login-password \
| docker login \
--username AWS \
--password-stdin038832651490.dkr.ecr.ap-south-1.amazonaws.com
```

Tag the image.

```bash
docker tag pulsecheck:latest \
038832651490.dkr.ecr.ap-south-1.amazonaws.com/pulsecheck-repo:latest
```

Push the image.

```bash
docker push \
038832651490.dkr.ecr.ap-south-1.amazonaws.com/pulsecheck-repo:latest
```

---

## Deploy Through Jenkins

After configuring the Jenkins pipeline:

1. Open Jenkins Dashboard.
2. Select the PulseCheck pipeline.
3. Click **Build Now**.
4. Monitor the Console Output.
5. Verify a successful build.

The Jenkins pipeline performs:

- Source Code Checkout
- Dependency Installation
- Unit Testing
- Docker Build
- Amazon ECR Push
- Terraform Validation
- Terraform Apply
- Amazon ECS Deployment

---

# Monitoring

The application is monitored using multiple AWS services.

## Amazon CloudWatch

CloudWatch is configured to collect:

- Container Logs
- ECS Logs
- Application Output

This enables centralized monitoring and troubleshooting.

---

## ECS Container Insights

Container Insights provides operational metrics including:

- CPU Utilization
- Memory Utilization
- Running Tasks
- Network Activity

---

## Application Health Checks

The Application Load Balancer continuously checks:

```
/health
```

Only healthy ECS tasks receive production traffic.

---

# Security

The project follows several AWS security best practices.

## IAM Roles

IAM Roles are used instead of storing AWS credentials inside containers.

---

## Security Groups

Security Groups restrict access between AWS resources.

Only the Application Load Balancer can communicate with the ECS service.

---

## Private Container Registry

Docker images are stored inside a private Amazon ECR repository.

---

## Remote Terraform State

Terraform state is stored securely in Amazon S3 to avoid local state inconsistencies.

---

# Troubleshooting

During development, several deployment issues were encountered and resolved.

## Jenkins Executor Offline

Issue:

Jenkins builds remained in a waiting state because the Built-In Node automatically went offline after disk space reached the configured threshold.

Resolution:

- Increased the EC2 root EBS volume.
- Expanded the filesystem.
- Restarted Jenkins.
- Restored the Built-In Node to the online state.

---

## Docker Permission Issue

Issue:

The Jenkins user could not communicate with the Docker daemon.

Resolution:

Added the Jenkins user to the Docker group and restarted Jenkins.

---

## Terraform State Conflict

Issue:

Terraform attempted to recreate AWS resources because Jenkins was using a different local state file.

Resolution:

Migrated Terraform state to a shared Amazon S3 backend to ensure consistent infrastructure management.

---

## Terraform Backend Migration

Issue:

Terraform initialization requested interactive confirmation during Jenkins execution.

Resolution:

Performed a one-time backend migration manually and updated the Jenkins pipeline to use:

```bash
terraform init -input=false
```

This prevents interactive prompts during automated deployments.

---

# Future Enhancements

The current implementation provides a fully automated deployment pipeline.

Future improvements include:

- GitHub Webhook Integration
- HTTPS using AWS Certificate Manager (ACM)
- Route53 Custom Domain
- Blue-Green Deployments
- SonarQube Code Quality Analysis
- Trivy Container Image Scanning
- Prometheus Metrics Collection
- Grafana Dashboards
- Slack Build Notifications
- Multi-Environment Deployments (Dev, QA, Production)

---

# Lessons Learned

This project provided practical experience with:

- Infrastructure as Code
- Cloud Networking
- Containerization
- Continuous Integration
- Continuous Deployment
- AWS Identity and Access Management
- Terraform State Management
- Amazon ECS Deployments
- Jenkins Pipeline Automation
- Production Troubleshooting
- Cloud Monitoring

The implementation also reinforced the importance of automation, repeatability, infrastructure consistency, and operational monitoring in modern DevOps environments.

---

# Author

**Shreyas Pujar Veerappa**

DevOps Engineer

GitHub:

https://github.com/ShreyasSid22

