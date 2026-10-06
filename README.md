#  Task Manager — Full DevOps CI/CD & Kubernetes Deployment

A production-style **Task Manager application** deployed using modern DevOps practices and tools.

This project demonstrates the complete journey from application development to cloud infrastructure provisioning, configuration management, containerization, Kubernetes orchestration, monitoring, and automated CI/CD.

---

## 📌 Table of Contents

1. [Project Overview](#-project-overview)
2. [Project Goals](#-project-goals)
3. [Application Architecture](#-application-architecture)
4. [Technology Stack](#-technology-stack)
5. [Application Features](#-application-features)
6. [Project Structure](#-project-structure)
7. [Prerequisites](#-prerequisites)
8. [Application Setup](#-application-setup)
9. [Run the Application Locally](#-run-the-application-locally)
10. [Docker Setup](#-docker-setup)
11. [Docker Compose](#-docker-compose)
12. [AWS Infrastructure](#-aws-infrastructure)
13. [Terraform](#-terraform)
14. [Terraform Workflow](#-terraform-workflow)
15. [Ansible Configuration](#-ansible-configuration)
16. [Test Ansible Connectivity](#-test-ansible-connectivity)
17. [Install Docker with Ansible](#-install-docker-with-ansible)
18. [Install k3s](#-install-k3s)
19. [Kubernetes Deployment](#-kubernetes-deployment)
20. [PostgreSQL Database](#-postgresql-database)
21. [Deploy the Application to Kubernetes](#-deploy-the-application-to-kubernetes)
22. [Verify Kubernetes](#-verify-kubernetes)
23. [Monitoring](#-monitoring)
24. [Docker Hub](#-docker-hub)
25. [GitHub Actions CI/CD](#-github-actions-cicd)
26. [GitHub Secrets](#-github-secrets)
27. [CI/CD Workflow](#-cicd-workflow)
28. [Deployment Verification](#-deployment-verification)
29. [Useful Kubernetes Commands](#-useful-kubernetes-commands)
30. [Useful Docker Commands](#-useful-docker-commands)
31. [Useful Ansible Commands](#-useful-ansible-commands)
32. [Useful Terraform Commands](#-useful-terraform-commands)
33. [Troubleshooting](#-troubleshooting)
34. [Security](#-security)
35. [DevOps Skills Demonstrated](#-devops-skills-demonstrated)
36. [Final Architecture](#-final-architecture)
37. [CI/CD Flow](#-cicd-flow)
38. [Project Outcome](#-project-outcome)

---

# 📋 Project Overview

The Task Manager is a full-stack web application consisting of:

* React/Vite frontend
* Node.js/Express backend
* PostgreSQL database
* Docker containers
* AWS infrastructure
* Terraform infrastructure as code
* Ansible configuration management
* k3s Kubernetes cluster
* Kubernetes workloads and services
* Docker Hub image registry
* GitHub Actions CI/CD
* Grafana monitoring

The project was designed to demonstrate how a developer can take an application from:

```text
Source Code
     ↓
Local Development
     ↓
Docker
     ↓
AWS Infrastructure
     ↓
Terraform
     ↓
Ansible
     ↓
k3s / Kubernetes
     ↓
Docker Hub
     ↓
GitHub Actions
     ↓
Automated Deployment
     ↓
Monitoring
```

---

#  Project Goals

The main goals of this project are to demonstrate practical DevOps skills including:

* Linux administration
* Git and GitHub
* Docker
* Docker Compose
* AWS
* Infrastructure as Code
* Terraform
* Ansible
* Kubernetes
* k3s
* PostgreSQL
* Container registries
* CI/CD
* GitHub Actions
* Monitoring
* Application deployment
* Infrastructure automation
* Deployment troubleshooting

---

# 🏗️ Application Architecture

The application consists of three main components.

```text
                    ┌──────────────────────┐
                    │      User Browser    │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │   React/Vite Frontend│
                    │        Port 5173     │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │ Node.js / Express API│
                    │        Port 5000     │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │      PostgreSQL      │
                    │        Port 5432     │
                    └──────────────────────┘
```

---

# 🛠️ Technology Stack

| Category                 | Technology     |
| ------------------------ | -------------- |
| Frontend                 | React          |
| Build Tool               | Vite           |
| Backend                  | Node.js        |
| API                      | Express.js     |
| Database                 | PostgreSQL     |
| Containerization         | Docker         |
| Local Orchestration      | Docker Compose |
| Cloud                    | AWS            |
| Infrastructure as Code   | Terraform      |
| Configuration Management | Ansible        |
| Kubernetes Distribution  | k3s            |
| Container Registry       | Docker Hub     |
| CI/CD                    | GitHub Actions |
| Monitoring               | Grafana        |
| Operating System         | Ubuntu Linux   |
| Version Control          | Git/GitHub     |

---

# ✨ Application Features

The Task Manager application supports basic task management functionality.

Users can:

* Create tasks
* View tasks
* Update tasks
* Delete tasks
* Interact with the backend API
* Store application data in PostgreSQL

The application is separated into frontend and backend services to demonstrate a real multi-tier deployment architecture.

---

# 📁 Project Structure

The project follows this structure:

```text
task-manager/
│
├── frontend/
│   ├── src/
│   ├── public/
│   ├── package.json
│   ├── vite.config.js
│   └── Dockerfile
│
├── backend/
│   ├── server.js
│   ├── package.json
│   └── Dockerfile
│
├── nginx/
│   └── nginx.conf
│
├── kubernetes/
│   └── task-manager/
│       ├── namespace.yaml
│       ├── secret.yaml
│       ├── postgres-pvc.yaml
│       ├── postgres-deployment.yaml
│       ├── postgres-service.yaml
│       ├── backend-deployment.yaml
│       ├── backend-service.yaml
│       ├── frontend-deployment.yaml
│       ├── frontend-service.yaml
│       └── ingress.yaml
│
├── terraform/
│   ├── versions.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── main.tf
│   ├── outputs.tf
│   └── terraform.tfvars
│
├── ansible/
│   ├── inventory.ini
│   ├── site.yml
│   └── roles/
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── docker-compose.yml
├── .gitignore
└── README.md
```

---

# 💻 Prerequisites

Before starting, install:

### Local Machine

* Git
* Docker
* Docker Compose
* Node.js
* npm
* VS Code
* WSL Ubuntu
* AWS CLI
* Terraform
* Ansible
* kubectl

### Cloud

An AWS account is required.

The project uses AWS EC2 for the Kubernetes server.

---

# 1️⃣ Clone the Repository

Clone the project:

```bash
git clone https://github.com/OnomeVera/<YOUR-REPOSITORY>.git
```

Move into the project:

```bash
cd task-manager
```

Check the repository:

```bash
git status
```

---

# 2️⃣ Application Setup

## Backend

Move into the backend:

```bash
cd backend
```

Install dependencies:

```bash
npm install
```

The backend runs on:

```text
http://localhost:5000
```

Return to the project root:

```bash
cd ..
```

---

# 3️⃣ Frontend Setup

Move into the frontend:

```bash
cd frontend
```

Install dependencies:

```bash
npm install
```

Start the development server:

```bash
npm run dev
```

The frontend is available at:

```text
http://localhost:5173
```

Return to the project root:

```bash
cd ..
```

---

# 4️⃣ Run the Application Locally

The application can be tested locally before containerization.

Start the backend:

```bash
cd backend
npm start
```

Start the frontend in another terminal:

```bash
cd frontend
npm run dev
```

The application should now be available through the frontend.

---

# 🐳 Docker Setup

Docker packages each component of the application into a container.

The project uses separate containers for:

```text
Frontend
Backend
PostgreSQL
```

---

# 5️⃣ Build Docker Images

Build the backend image:

```bash
docker build -t task-manager-backend ./backend
```

Build the frontend image:

```bash
docker build -t task-manager-frontend ./frontend
```

Check the images:

```bash
docker images
```

---

# 6️⃣ Run Docker Containers

Backend:

```bash
docker run -d \
  --name task-manager-backend \
  -p 5000:5000 \
  task-manager-backend
```

Frontend:

```bash
docker run -d \
  --name task-manager-frontend \
  -p 5173:5173 \
  task-manager-frontend
```

Check running containers:

```bash
docker ps
```

---

# 🐳 Docker Compose

Docker Compose allows the application stack to be started with one command.

The project includes:

```text
docker-compose.yml
```

Start the complete stack:

```bash
docker compose up -d
```

Check containers:

```bash
docker compose ps
```

View logs:

```bash
docker compose logs
```

View logs for a specific service:

```bash
docker compose logs backend
```

Stop the application:

```bash
docker compose down
```

---

# ☁️ AWS Infrastructure

The production environment is hosted on AWS.

The infrastructure includes:

```text
AWS
 │
 ├── VPC
 │
 ├── Public Subnet
 │
 ├── Internet Gateway
 │
 ├── Route Table
 │
 ├── Security Group
 │
 ├── EC2 Instance
 │
 └── EBS Storage
```

The EC2 instance hosts:

* Docker
* k3s
* Kubernetes workloads
* PostgreSQL
* Application containers
* Monitoring components

---

# 🏗️ Terraform

Terraform is used to provision the AWS infrastructure.

Terraform manages infrastructure as code instead of manually creating resources through the AWS Console.

---

# 7️⃣ Terraform Configuration

Move into Terraform:

```bash
cd terraform
```

Initialize Terraform:

```bash
terraform init
```

Format the configuration:

```bash
terraform fmt
```

Validate the configuration:

```bash
terraform validate
```

Create a plan:

```bash
terraform plan
```

Apply the infrastructure:

```bash
terraform apply
```

Type:

```text
yes
```

when Terraform asks for confirmation.

---

# 8️⃣ Terraform Outputs

After deployment:

```bash
terraform output
```

The outputs can provide information such as:

* EC2 public IP
* Instance ID
* VPC ID
* Security group ID

The EC2 public IP is required by Ansible.

---

# 9️⃣ Terraform State

Terraform maintains infrastructure state using:

```text
terraform.tfstate
```

This file should **not** be committed to GitHub.

Add it to `.gitignore`:

```text
terraform.tfstate
terraform.tfstate.*
.terraform/
*.tfvars
```

Never commit AWS credentials, private keys, passwords, or secrets.

---

# 🔐 Terraform Resource Protection

Critical infrastructure can be protected using Terraform lifecycle settings.

Example:

```hcl
lifecycle {
  prevent_destroy = true
}
```

This helps prevent accidental destruction of important resources.

---

# ⚙️ Ansible Configuration

After Terraform provisions the server, Ansible configures it.

Ansible is responsible for tasks such as:

* Connecting to EC2
* Installing required packages
* Installing Docker
* Installing k3s
* Configuring the server
* Preparing the Kubernetes environment

---

# 10️⃣ Ansible Inventory

The inventory is located at:

```text
ansible/inventory.ini
```

Example:

```ini
[k8s]
server ansible_host=<EC2_PUBLIC_IP> ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/devops
```

Replace:

```text
<EC2_PUBLIC_IP>
```

with the current EC2 public IP.

---

# 11️⃣ Test Ansible Connectivity

Before installing anything, test connectivity.

Run:

```bash
ansible -i ansible/inventory.ini k8s -m ping
```

Expected result:

```text
server | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
```

If Ansible returns:

```text
pong
```

the connection is working.

---

# 12️⃣ Install Docker with Ansible

Run the Ansible playbook:

```bash
ansible-playbook \
  -i ansible/inventory.ini \
  ansible/site.yml
```

The playbook configures the server.

Check Docker on the server:

```bash
docker --version
```

Check Docker service:

```bash
sudo systemctl status docker
```

---

# 13️⃣ Install k3s

Only install k3s **after Terraform and Ansible are stable**.

Run:

```bash
ansible-playbook \
  -i ansible/inventory.ini \
  ansible/site.yml
```

The Ansible playbook installs and configures k3s.

k3s provides the lightweight Kubernetes cluster used by this project.

---

# ☸️ Kubernetes

The project uses Kubernetes to orchestrate the application containers.

The Kubernetes architecture is:

```text
                    Kubernetes / k3s
                           │
        ┌──────────────────┼──────────────────┐
        │                  │                  │
        ▼                  ▼                  ▼
    Frontend            Backend           PostgreSQL
        │                  │                  │
        │                  └─────────┬────────┘
        │                            │
        └────────────────────────────┘
```

---

# 14️⃣ Verify Kubernetes

After k3s is installed, verify the cluster:

```bash
kubectl get nodes
```

Expected output should show the node as:

```text
Ready
```

Example:

```text
NAME        STATUS   ROLES                  AGE
server      Ready    control-plane,master   ...
```

Check all pods:

```bash
kubectl get pods -A
```

Check services:

```bash
kubectl get svc -A
```

---

# 15️⃣ Create the Task Manager Namespace

The application runs inside its own namespace.

```bash
kubectl apply -f kubernetes/task-manager/namespace.yaml
```

Verify:

```bash
kubectl get namespaces
```

---

# 🔐 Kubernetes Secrets

Database credentials are stored in a Kubernetes Secret.

The project uses:

```text
task-manager-secrets
```

The secret contains values such as:

```text
DB_USER
DB_PASSWORD
DB_NAME
```

Never commit real passwords to GitHub.

Check the secret:

```bash
kubectl get secrets -n task-manager
```

---

# 🗄️ PostgreSQL Database

PostgreSQL runs inside Kubernetes.

The database uses persistent storage so that data is not lost when the PostgreSQL pod is recreated.

The project uses:

```text
PostgreSQL 16
```

Database service:

```text
postgres
```

Port:

```text
5432
```

---

# 16️⃣ PostgreSQL Persistent Storage

The database uses a:

```text
5Gi PersistentVolumeClaim
```

Check the PVC:

```bash
kubectl get pvc -n task-manager
```

Expected status:

```text
Bound
```

The storage uses the k3s local-path storage provisioner.

---

# 17️⃣ Deploy PostgreSQL

Apply the database configuration:

```bash
kubectl apply -f kubernetes/task-manager/postgres-pvc.yaml
```

```bash
kubectl apply -f kubernetes/task-manager/postgres-deployment.yaml
```

```bash
kubectl apply -f kubernetes/task-manager/postgres-service.yaml
```

Check:

```bash
kubectl get pods -n task-manager
```

Check the service:

```bash
kubectl get svc -n task-manager
```

---

# 18️⃣ Deploy the Backend

Apply the backend deployment:

```bash
kubectl apply -f kubernetes/task-manager/backend-deployment.yaml
```

Apply the backend service:

```bash
kubectl apply -f kubernetes/task-manager/backend-service.yaml
```

Check:

```bash
kubectl get pods -n task-manager
```

---

# 19️⃣ Deploy the Frontend

Apply the frontend deployment:

```bash
kubectl apply -f kubernetes/task-manager/frontend-deployment.yaml
```

Apply the frontend service:

```bash
kubectl apply -f kubernetes/task-manager/frontend-service.yaml
```

Check:

```bash
kubectl get pods -n task-manager
```

---

# 20️⃣ Deploy Ingress

If an ingress configuration is included:

```bash
kubectl apply -f kubernetes/task-manager/ingress.yaml
```

Check:

```bash
kubectl get ingress -n task-manager
```

---

# 21️⃣ Deploy All Kubernetes Resources

Instead of applying every manifest individually, the entire application can be deployed with:

```bash
kubectl apply -f kubernetes/task-manager/
```

Verify:

```bash
kubectl get all -n task-manager
```

---

# 🔍 Kubernetes Verification

Check pods:

```bash
kubectl get pods -n task-manager
```

Check deployments:

```bash
kubectl get deployments -n task-manager
```

Check services:

```bash
kubectl get svc -n task-manager
```

Check PVC:

```bash
kubectl get pvc -n task-manager
```

Check events:

```bash
kubectl get events -n task-manager
```

---

# 📊 Monitoring

Monitoring is included using Grafana.

Check Grafana:

```bash
kubectl get pods -A | grep grafana
```

Check the service:

```bash
kubectl get svc -A | grep grafana
```

The project uses NodePort:

```text
30080
```

Grafana can therefore be exposed through the Kubernetes NodePort configuration.

---

# 🐳 Docker Hub

The project publishes application images to Docker Hub.

Docker Hub repositories:

```text
onomeoviero/task-manager-backend
```

```text
onomeoviero/task-manager-frontend
```

---

# 22️⃣ Login to Docker Hub

```bash
docker login
```

Enter the Docker Hub username and password/token.

---

# 23️⃣ Tag Images

Backend:

```bash
docker tag task-manager-backend:latest \
  onomeoviero/task-manager-backend:latest
```

Frontend:

```bash
docker tag task-manager-frontend:latest \
  onomeoviero/task-manager-frontend:latest
```

---

# 24️⃣ Push Images

Backend:

```bash
docker push onomeoviero/task-manager-backend:latest
```

Frontend:

```bash
docker push onomeoviero/task-manager-frontend:latest
```

Verify the repositories in Docker Hub.

---

# 🔄 GitHub Actions CI/CD

The final stage of the project is automation.

GitHub Actions automatically performs:

```text
Test
  ↓
Build
  ↓
Push
  ↓
Deploy
```

The workflow is located at:

```text
.github/workflows/deploy.yml
```

---

# 25️⃣ CI/CD Pipeline

The pipeline performs four major stages.

## Stage 1 — Test

The application is tested before deployment.

```text
GitHub Repository
       ↓
Install dependencies
       ↓
Run tests
```

If tests fail, the pipeline stops.

---

## Stage 2 — Build

Docker images are built.

```text
Backend Source
      ↓
Docker Build
      ↓
Backend Image
```

and:

```text
Frontend Source
      ↓
Docker Build
      ↓
Frontend Image
```

---

## Stage 3 — Push

Images are pushed to Docker Hub.

```text
GitHub Actions
      ↓
Docker Hub
      ↓
Backend Image
Frontend Image
```

---

## Stage 4 — Deploy

The latest images are deployed to Kubernetes.

```text
Docker Hub
     ↓
Kubernetes / k3s
     ↓
Task Manager
```

---

# 🔑 GitHub Actions Secrets

The following GitHub repository secrets are required:

```text
DOCKERHUB_USERNAME
DOCKERHUB_TOKEN
SERVER_HOST
SERVER_SSH_KEY
```

---

## DOCKERHUB_USERNAME

Your Docker Hub username:

```text
onomeoviero
```

---

## DOCKERHUB_TOKEN

Use a Docker Hub Access Token.

Do not store the Docker Hub password directly in GitHub Actions.

---

## SERVER_HOST

The public IP address or hostname of the Kubernetes server.

Example:

```text
34.xxx.xxx.xxx
```

---

## SERVER_SSH_KEY

The private SSH key used by GitHub Actions to connect to the server.

Example:

```text
-----BEGIN OPENSSH PRIVATE KEY-----
...
-----END OPENSSH PRIVATE KEY-----
```

Never commit the private key to GitHub.

---

# 26️⃣ GitHub Actions Workflow

The pipeline follows:

```text
Developer
    │
    ▼
Git Push
    │
    ▼
GitHub
    │
    ▼
GitHub Actions
    │
    ├── Test
    │
    ├── Build Docker Images
    │
    ├── Push to Docker Hub
    │
    └── Deploy to Kubernetes
             │
             ▼
          k3s
             │
             ▼
       Task Manager
```

---

# 27️⃣ Kubernetes Image Update

When a new Docker image is pushed, Kubernetes can update the deployment.

Example:

```bash
kubectl set image deployment/task-manager-backend \
  backend=onomeoviero/task-manager-backend:latest \
  -n task-manager
```

Frontend:

```bash
kubectl set image deployment/task-manager-frontend \
  frontend=onomeoviero/task-manager-frontend:latest \
  -n task-manager
```

Check rollout:

```bash
kubectl rollout status deployment/task-manager-backend \
  -n task-manager
```

```bash
kubectl rollout status deployment/task-manager-frontend \
  -n task-manager
```

---

# 🔎 Deployment Verification

After deployment:

```bash
kubectl get pods -n task-manager
```

All application pods should eventually show:

```text
Running
```

Check deployments:

```bash
kubectl get deployments -n task-manager
```

Check services:

```bash
kubectl get svc -n task-manager
```

Check everything:

```bash
kubectl get all -n task-manager
```

---

# 🧪 Test the Backend

Get the backend pod:

```bash
kubectl get pods -n task-manager
```

View backend logs:

```bash
kubectl logs deployment/task-manager-backend \
  -n task-manager
```

If the backend exposes a health endpoint:

```bash
curl http://<SERVER_IP>:5000/health
```

---

# 🌐 Test the Frontend

Open the server's exposed frontend endpoint in a browser.

Example:

```text
http://<SERVER_IP>
```

The exact URL depends on the Kubernetes Service/Ingress configuration.

---

# 🛠️ Useful Kubernetes Commands

## Get Nodes

```bash
kubectl get nodes
```

## Get Pods

```bash
kubectl get pods -n task-manager
```

## Get Services

```bash
kubectl get svc -n task-manager
```

## Get Deployments

```bash
kubectl get deployments -n task-manager
```

## Get PVC

```bash
kubectl get pvc -n task-manager
```

## Get Ingress

```bash
kubectl get ingress -n task-manager
```

## Describe Pod

```bash
kubectl describe pod <POD_NAME> -n task-manager
```

## View Logs

```bash
kubectl logs <POD_NAME> -n task-manager
```

## Follow Logs

```bash
kubectl logs -f <POD_NAME> -n task-manager
```

## Restart Deployment

```bash
kubectl rollout restart deployment/<DEPLOYMENT_NAME> \
  -n task-manager
```

## Check Rollout

```bash
kubectl rollout status deployment/<DEPLOYMENT_NAME> \
  -n task-manager
```

---

# 🐳 Useful Docker Commands

List running containers:

```bash
docker ps
```

List all containers:

```bash
docker ps -a
```

List images:

```bash
docker images
```

View logs:

```bash
docker logs <CONTAINER>
```

Stop container:

```bash
docker stop <CONTAINER>
```

Remove container:

```bash
docker rm <CONTAINER>
```

Remove image:

```bash
docker rmi <IMAGE>
```

---

# ⚙️ Useful Ansible Commands

Test connectivity:

```bash
ansible -i ansible/inventory.ini k8s -m ping
```

Run the playbook:

```bash
ansible-playbook \
  -i ansible/inventory.ini \
  ansible/site.yml
```

Check inventory:

```bash
ansible-inventory \
  -i ansible/inventory.ini \
  --list
```

Run a command on the server:

```bash
ansible -i ansible/inventory.ini k8s \
  -m shell \
  -a "docker --version"
```

Check k3s:

```bash
ansible -i ansible/inventory.ini k8s \
  -m shell \
  -a "sudo k3s --version"
```

---

#  Useful Terraform Commands

Initialize:

```bash
terraform init
```

Format:

```bash
terraform fmt
```

Validate:

```bash
terraform validate
```

Plan:

```bash
terraform plan
```

Apply:

```bash
terraform apply
```

Show outputs:

```bash
terraform output
```

Show state:

```bash
terraform show
```

List resources:

```bash
terraform state list
```

---

#  Troubleshooting

## Ansible Cannot Connect

Test SSH manually:

```bash
ssh -i ~/.ssh/devops ubuntu@<SERVER_IP>
```

Then test Ansible:

```bash
ansible -i ansible/inventory.ini k8s -m ping
```

---

## Kubernetes Node Not Ready

Run:

```bash
kubectl get nodes
```

Then:

```bash
kubectl describe node <NODE_NAME>
```

Check k3s:

```bash
sudo systemctl status k3s
```

Check k3s logs:

```bash
sudo journalctl -u k3s -f
```

---

## Pod Not Running

Check:

```bash
kubectl get pods -n task-manager
```

Then:

```bash
kubectl describe pod <POD_NAME> -n task-manager
```

View logs:

```bash
kubectl logs <POD_NAME> -n task-manager
```

---

## ImagePullBackOff

Check:

```bash
kubectl describe pod <POD_NAME> -n task-manager
```

Verify that the image exists in Docker Hub.

Check:

```bash
docker pull onomeoviero/task-manager-backend:latest
```

and:

```bash
docker pull onomeoviero/task-manager-frontend:latest
```

---

## PostgreSQL Pod Not Running

Check:

```bash
kubectl get pods -n task-manager
```

Check PVC:

```bash
kubectl get pvc -n task-manager
```

The PostgreSQL PVC should show:

```text
Bound
```

Check logs:

```bash
kubectl logs deployment/postgres -n task-manager
```

---

## Backend Cannot Connect to PostgreSQL

Verify PostgreSQL service:

```bash
kubectl get svc postgres -n task-manager
```

The backend should use the Kubernetes service name:

```text
postgres
```

and PostgreSQL port:

```text
5432
```

Verify the secret:

```bash
kubectl get secret task-manager-secrets \
  -n task-manager
```

---

## GitHub Actions Deployment Fails

Check:

```text
Settings
   ↓
Secrets and variables
   ↓
Actions
```

Verify:

```text
DOCKERHUB_USERNAME
DOCKERHUB_TOKEN
SERVER_HOST
SERVER_SSH_KEY
```

Also verify that the SSH key matches the EC2 instance.

---

#  Security

Security is an important part of the project.

The following should **never** be committed to GitHub:

```text
AWS credentials
SSH private keys
Docker Hub passwords
Database passwords
Kubernetes secret values
terraform.tfstate
.env files
```

Use:

```text
GitHub Secrets
Kubernetes Secrets
AWS IAM
SSH keys
```

for sensitive information.

---

#  DevOps Skills Demonstrated

This project demonstrates practical experience with:

### Linux

* Ubuntu
* SSH
* systemd
* Linux commands
* Server administration

### Git

* Git repositories
* Branching
* Commits
* GitHub

### Docker

* Dockerfiles
* Docker images
* Containers
* Docker Compose
* Docker Hub

### AWS

* EC2
* VPC
* Subnets
* Internet Gateway
* Route Tables
* Security Groups
* EBS
* Elastic IP

### Terraform

* Infrastructure as Code
* AWS provider
* Variables
* Outputs
* State management
* Resource lifecycle
* Infrastructure provisioning

### Ansible

* Inventory
* Playbooks
* Server configuration
* Docker installation
* k3s installation
* Remote automation

### Kubernetes

* k3s
* Pods
* Deployments
* Services
* Namespaces
* Secrets
* PersistentVolumeClaims
* Ingress
* NodePort
* Rollouts

### CI/CD

* GitHub Actions
* Automated testing
* Docker builds
* Docker Hub publishing
* Kubernetes deployment

### Monitoring

* Grafana
* Kubernetes monitoring
* Application troubleshooting

---

#  Final Architecture

The completed project demonstrates the following DevOps workflow:

```text
                           ┌──────────────────┐
                           │      GitHub      │
                           │     Actions      │
                           └────────┬─────────┘
                                    │
                         ┌──────────┴──────────┐
                         │                     │
                         ▼                     ▼
                    Test Code             Build Images
                                               │
                                               ▼
                                      ┌─────────────────┐
                                      │    Docker Hub   │
                                      └────────┬────────┘
                                               │
                                               ▼
┌──────────────────────────────────────────────────────────────────┐
│                            AWS CLOUD                             │
│                                                                  │
│   ┌──────────────────────────────────────────────────────────┐   │
│   │                         EC2                              │   │
│   │                                                          │   │
│   │                    ┌─────────────┐                       │   │
│   │                    │     k3s     │                       │   │
│   │                    │ Kubernetes  │                       │   │
│   │                    └──────┬──────┘                       │   │
│   │                           │                              │   │
│   │          ┌────────────────┼────────────────┐             │   │
│   │          │                │                │             │   │
│   │          ▼                ▼                ▼             │   │
│   │     ┌──────────┐    ┌──────────┐    ┌────────────┐      │   │
│   │     │ Frontend │    │ Backend  │    │ PostgreSQL │      │   │
│   │     │  React   │───▶│ Node/API │───▶│     DB     │      │   │
│   │     └──────────┘    └──────────┘    └────────────┘      │   │
│   │                                             │             │   │
│   │                                             ▼             │   │
│   │                                      ┌────────────┐       │   │
│   │                                      │    EBS /   │       │   │
│   │                                      │ Persistent │       │   │
│   │                                      │  Storage   │       │   │
│   │                                      └────────────┘       │   │
│   │                                                          │   │
│   │                    ┌─────────────┐                       │   │
│   │                    │   Grafana   │                       │   │
│   │                    │ Monitoring  │                       │   │
│   │                    └─────────────┘                       │   │
│   └──────────────────────────────────────────────────────────┘   │
│                                                                  │
│                    AWS VPC / Subnet / SG                         │
└──────────────────────────────────────────────────────────────────┘

          ▲
          │
     Terraform
          │
          ▼
   AWS Infrastructure

          ▲
          │
       Ansible
          │
          ▼
 Docker + k3s Configuration
```

---

#  Complete DevOps Workflow

The entire project follows this process:

```text
                         DEVELOPER
                             │
                             ▼
                     ┌─────────────┐
                     │   GitHub    │
                     └──────┬──────┘
                            │
                            ▼
                    GitHub Actions
                            │
               ┌────────────┴────────────┐
               │                         │
               ▼                         ▼
             TEST                      BUILD
               │                         │
               └────────────┬────────────┘
                            │
                            ▼
                         PUSH
                            │
                            ▼
                     ┌────────────┐
                     │ Docker Hub │
                     └─────┬──────┘
                           │
                           ▼
                         DEPLOY
                           │
                           ▼
                  ┌────────────────┐
                  │   AWS EC2      │
                  │                │
                  │      k3s       │
                  │       │        │
                  │  ┌────┼─────┐  │
                  │  │    │     │  │
                  │  ▼    ▼     ▼  │
                  │ FE   API    DB │
                  │                │
                  └────────────────┘
                           │
                           ▼
                       MONITORING
                           │
                           ▼
                        Grafana
```

---

#  Infrastructure Provisioning Workflow

Infrastructure follows:

```text
Terraform
    │
    ▼
AWS VPC
    │
    ▼
Subnet
    │
    ▼
Security Group
    │
    ▼
EC2
    │
    ▼
Ansible
    │
    ├── Configure Ubuntu
    │
    ├── Install Docker
    │
    └── Install k3s
             │
             ▼
        Kubernetes
             │
             ├── PostgreSQL
             ├── Backend
             ├── Frontend
             └── Monitoring
```

---

#  CI/CD Deployment Workflow

After the infrastructure is ready, application deployment becomes automated:

```text
Developer pushes code
          │
          ▼
       GitHub
          │
          ▼
   GitHub Actions
          │
          ▼
       Run Tests
          │
       ┌──┴──┐
       │     │
      FAIL   PASS
       │     │
       ▼     ▼
      STOP  Docker Build
                │
                ▼
           Docker Hub
                │
                ▼
          Kubernetes
                │
                ▼
          Rolling Update
                │
                ▼
          Application
```

---

# 📈 Deployment Benefits

This architecture provides:

* Repeatable infrastructure
* Automated configuration
* Containerized applications
* Kubernetes orchestration
* Persistent database storage
* Automated deployments
* Version-controlled infrastructure
* Automated testing
* Centralized container images
* Monitoring
* Easier troubleshooting
* Reduced manual deployment work

---

# 🧪 Project Validation Checklist

Before considering the project complete, verify each layer.

### Application

```text
☐ Frontend works
☐ Backend API works
☐ PostgreSQL works
```

### Docker

```text
☐ Backend image builds
☐ Frontend image builds
☐ Containers start successfully
☐ Docker Compose works
```

### AWS

```text
☐ VPC created
☐ Subnet created
☐ Internet Gateway configured
☐ Route table configured
☐ Security Group configured
☐ EC2 running
☐ EBS available
```

### Terraform

```text
☐ terraform init
☐ terraform validate
☐ terraform plan
☐ terraform apply
☐ terraform output
```

### Ansible

```text
☐ Inventory configured
☐ ansible ping successful
☐ Docker installed
☐ k3s installed
```

### Kubernetes

```text
☐ kubectl works
☐ Node is Ready
☐ Namespace exists
☐ PostgreSQL pod Running
☐ Backend pod Running
☐ Frontend pod Running
☐ PVC Bound
☐ Services available
```

### Docker Hub

```text
☐ Backend image pushed
☐ Frontend image pushed
```

### GitHub Actions

```text
☐ Tests run
☐ Docker images build
☐ Images pushed
☐ Deployment runs
☐ Kubernetes rollout succeeds
```

### Monitoring

```text
☐ Grafana running
☐ Grafana service available
```

---

#  Project Outcome

This project demonstrates a complete **end-to-end DevOps implementation**.

Starting from a full-stack application, the project progresses through:

```text
Application Development
        ↓
Git/GitHub
        ↓
Docker
        ↓
Docker Compose
        ↓
AWS
        ↓
Terraform
        ↓
Ansible
        ↓
k3s
        ↓
Kubernetes
        ↓
PostgreSQL
        ↓
Docker Hub
        ↓
GitHub Actions
        ↓
Automated Deployment
        ↓
Grafana Monitoring
```

The result is a repeatable and automated deployment pipeline capable of taking application code from GitHub and delivering it to a Kubernetes environment running on AWS.

---

#  Author

**Onome Oviero**

DevOps Engineer | Cloud & Automation Engineer

GitHub: `https://github.com/OnomeVera`

LinkedIn: `https://linkedin.com/in/onome-oviero`

---

#  Key DevOps Concepts Demonstrated

> **Infrastructure as Code + Configuration Management + Containerization + Kubernetes + CI/CD + Monitoring**

This project demonstrates how these technologies work together to create a modern automated software delivery pipeline.

---

## ⭐ Final Pipeline

```text
                    ┌───────────────────┐
                    │      DEVELOPER    │
                    └─────────┬─────────┘
                              │
                              ▼
                    ┌───────────────────┐
                    │      GitHub       │
                    └─────────┬─────────┘
                              │
                              ▼
                    ┌───────────────────┐
                    │ GitHub Actions    │
                    │                   │
                    │  1. Test          │
                    │  2. Build         │
                    │  3. Push          │
                    │  4. Deploy        │
                    └─────────┬─────────┘
                              │
                              ▼
                    ┌───────────────────┐
                    │    Docker Hub     │
                    └─────────┬─────────┘
                              │
                              ▼
              ┌──────────────────────────────┐
              │           AWS EC2            │
              │                              │
              │             k3s              │
              │                              │
              │    ┌──────┬──────┬──────┐   │
              │    │      │      │      │   │
              │    ▼      ▼      ▼      ▼   │
              │ Frontend Backend PostgreSQL │
              │                         │    │
              │                         ▼    │
              │                    Persistent│
              │                     Storage  │
              │                              │
              │                    Grafana   │
              └──────────────────────────────┘
```

**End-to-end DevOps pipeline:**

```text
CODE → TEST → BUILD → PUSH → DEPLOY → MONITOR
```
