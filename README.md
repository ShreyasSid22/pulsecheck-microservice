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
