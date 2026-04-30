🚀 DevOps Portfolio Project – CI/CD | Kubernetes | Terraform | Monitoring










A complete end-to-end DevOps pipeline project demonstrating CI/CD automation, Kubernetes deployment, Terraform EKS provisioning, Dockerization, and Monitoring with Prometheus & Grafana.

Perfect portfolio project for DevOps, SRE, Platform Engineer, and Cloud Engineer roles.

🖼️ Architecture Diagram
ASCII Diagram
                ┌────────────────────┐
                │      Developer     │
                └──────────┬─────────┘
                           │ Git Push
                           ▼
                ┌────────────────────┐
                │   GitHub Actions   │
                │ CI: Test + Build   │
                │ CD: Deploy to K8s  │
                └──────────┬─────────┘
                           │ Docker Image
                           ▼
                ┌────────────────────┐
                │  Docker Registry   │
                └──────────┬─────────┘
                           │ Pull Image
                           ▼
        ┌───────────────────────────────────────┐
        │               AWS EKS                 │
        │  ┌─────────────┬─────────────┐       │
        │  │ Kubernetes   │ Kubernetes  │       │
        │  │ Deployment   │ Service     │       │
        │  └─────────────┴─────────────┘       │
        └───────────────────┬───────────────────┘
                            │ Metrics + Logs
                            ▼
                ┌────────────────────┐
                │ Prometheus         │
                │ Grafana Dashboards │
                └────────────────────┘
Image Placeholder (You can upload an image later)
📌 architecture-diagram.png  ← Add your diagram here

If you want, I can generate a real graphic diagram (PNG) for you — just say “Generate the architecture diagram image”.

🧰 Tech Stack
DevOps & Cloud
Docker
Kubernetes (k8s)
Terraform (AWS EKS)
GitHub Actions (CI/CD)
Monitoring
Prometheus
Grafana
Application
Node.js backend
Jest for testing
📁 Repository Structure
.github/workflows/ci-cd.yml     → CI/CD pipeline
Dockerfile                      → Node.js image build
docker-compose.yml              → Local dev & monitoring
k8s/                            → Kubernetes manifests
terraform/                      → AWS EKS infrastructure
monitoring/                     → Prometheus & Grafana configs
src/                            → Node.js app + tests
Makefile                        → Automation commands
⚙️ CI/CD Pipeline
CI Tasks
Install dependencies
Run Jest tests
Linting
Build Docker image
CD Tasks
Push Docker image to registry
Deploy to Kubernetes cluster
Rollout verification
🐳 Docker Setup

Build the image:

docker build -t devops-app .

Run locally:

docker run -p 3000:3000 devops-app
🧪 Local Development (docker-compose)
docker-compose up -d

This runs:

App
Prometheus
Grafana
Exporters
☸️ Kubernetes Deployment
kubectl apply -f k8s/namespace.yml
kubectl apply -f k8s/configmap.yml
kubectl apply -f k8s/deployment.yml

Check pods:

kubectl get pods -n devops-app
🌍 Terraform – AWS EKS
cd terraform
terraform init
terraform plan
terraform apply
📊 Monitoring
Grafana:
URL: http://localhost:3000
User: admin
Pass: admin
Prometheus:
http://localhost:9090
🧪 Testing (Jest)
npm test
✨ Features
Fully automated CI/CD pipeline
Kubernetes deployment
AWS EKS cluster via Terraform
Monitoring + dashboards
Makefile automation
Production-style project structure
## 🏗️ Architecture Diagram

![Architecture Diagram](architecture.png)
