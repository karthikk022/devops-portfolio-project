# DevOps Portfolio Project

A production-ready DevOps project demonstrating CI/CD, containerization, Kubernetes orchestration, Infrastructure as Code, and monitoring.

## Features

- **Node.js REST API** with health checks and Prometheus metrics
- **Docker** multi-stage build with security best practices
- **GitHub Actions CI/CD** with testing, security scanning, and automated deployment
- **Kubernetes** manifests with HPA, ingress, and security policies
- **Terraform** for AWS EKS infrastructure provisioning
- **Monitoring** stack with Prometheus and Grafana dashboards

## Architecture

```
├── src/                  # Node.js application
│   ├── app.js           # Main application
│   ├── app.test.js      # Unit tests
│   └── package.json
├── k8s/                 # Kubernetes manifests
│   ├── deployment.yml   # App deployment, service, ingress, HPA
│   └── namespace.yml    # Environment namespaces
├── terraform/           # Infrastructure as Code
│   ├── main.tf         # VPC, EKS cluster
│   ├── eks.tf          # EKS node groups
│   └── variables.tf    # Configurable variables
├── monitoring/          # Observability
│   ├── prometheus.yml  # Prometheus configuration
│   └── grafana-dashboard.json
├── .github/workflows/   # CI/CD pipelines
│   └── ci-cd.yml       # GitHub Actions workflow
├── Dockerfile           # Multi-stage container build
└── docker-compose.yml   # Local development stack
```

## Quick Start

### Local Development

```bash
# Install dependencies
cd src && npm install

# Run tests
npm test

# Start app locally
npm start

# Or use Docker Compose
docker-compose up -d
```

### CI/CD Pipeline

Pipeline triggers on push/PR to `main` or `develop`:
1. **Test**: Lint + Jest tests with coverage
2. **Build**: Docker image build and push to GHCR
3. **Security**: Trivy vulnerability scanning
4. **Deploy**: Automatic deployment to staging (develop) or production (main)

### Kubernetes Deployment

```bash
kubectl apply -f k8s/namespace.yml
kubectl apply -f k8s/deployment.yml -n production
```

### Infrastructure Provisioning

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

## API Endpoints

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/health` | GET | Health check |
| `/api/users` | GET | List users |
| `/api/users` | POST | Create user |
| `/api/metrics` | GET | Prometheus metrics |

## Technologies Demonstrated

- **Containerization**: Docker, Docker Compose
- **Orchestration**: Kubernetes (Deployments, Services, Ingress, HPA)
- **CI/CD**: GitHub Actions, GHCR
- **IaC**: Terraform, AWS EKS
- **Monitoring**: Prometheus, Grafana
- **Security**: Non-root containers, Trivy scanning, K8s security contexts

## Recruiter Notes

This project demonstrates:
- End-to-end DevOps implementation
- Production-grade Kubernetes deployments
- Automated CI/CD pipelines
- Infrastructure as Code best practices
- Observability and monitoring setup
- Security hardening at all layers
