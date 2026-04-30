.PHONY: help build test push deploy

help:
	@echo "DevOps Portfolio Project"
	@echo ""
	@echo "Commands:"
	@echo "  make build       - Build Docker image"
	@echo "  make test        - Run tests"
	@echo "  make run         - Run app locally"
	@echo "  make up          - Start with docker-compose"
	@echo "  make down        - Stop docker-compose"
	@echo "  make deploy-k8s  - Deploy to Kubernetes"
	@echo "  make tf-init     - Initialize Terraform"
	@echo "  make tf-plan     - Terraform plan"
	@echo "  make tf-apply    - Terraform apply"

build:
	docker build -t devops-portfolio-app:latest .

test:
	cd src && npm test

test-coverage:
	cd src && npm test -- --coverage

run:
	cd src && npm start

up:
	docker-compose up -d
	@echo "App: http://localhost:3000"
	@echo "Prometheus: http://localhost:9090"
	@echo "Grafana: http://localhost:3030 (admin/admin)"

down:
	docker-compose down

deploy-k8s:
	kubectl apply -f k8s/namespace.yml
	kubectl apply -f k8s/deployment.yml

tf-init:
	cd terraform && terraform init

tf-plan:
	cd terraform && terraform plan

tf-apply:
	cd terraform && terraform apply -auto-approve

tf-destroy:
	cd terraform && terraform destroy -auto-approve
