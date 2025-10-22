# 🚀 DevOps Demo App

This is a **DevOps fullstack demo project** showcasing modern cloud-native technologies.
Includes a Node.js backend, React frontend, PostgreSQL database, Docker containerization, Terraform-managed AWS infrastructure, and Kubernetes deployment.

- 🖥️ Node.js + Express backend with REST API
- 🌐 React frontend
- 🗄️ PostgreSQL database
- 🐳 Docker containerization & Docker Compose for local testing
- ☁️ AWS EKS deployment using Terraform for infra provisioning
- 🛠️ Configurable secrets via Kubernetes Secret and environment variables
- ✅ Healthchecks for backend, frontend, and DB

---

## **Prerequisites / Dependencies**

- Docker & Docker Compose
- Node.js 200
- AWS CLI configured
- kubectl installed

---

## 🏠 How to Run

### Locally (Docker Compose)
Build and run all services:

`docker-compose up --build`
Access URLs:
- 🌐 **Frontend**: [http://localhost:3000](http://localhost:3000)  
- 🖥️ **Backend API**: [http://localhost:5000/api/message](http://localhost:5000/api/message)  
- 🗄️ **Database**: `localhost:5432`, user: `devuser`, password: `devpass`, database: `devdb`  

---

## ☁️ AWS EKS Deployment
### 🐳 Docker Images

To push images to DockerHub, (replace < example > with your DockerHub username)

`docker build -t <example>/devops-demo-backend ./backend`  
`docker push <example>/devops-demo-backend`  

`docker build -t <example>/devops-demo-frontend ./frontend`  
`docker push <example>/devops-demo-frontend` 

---
Before running the project, update the following placeholders in the files:
- Docker images: Replace < example > with your DockerHub username in:
  - backend-deployment.yaml
  - frontend-deployment.yaml
  - docker-compose.yaml (if pushing/pulling images from DockerHub)
- RDS / Database endpoint: Replace <RDS_ENDPOINT_FROM_TERRAFORM> in:
  - backend-deployment.yaml → environment variable DB_HOST
  - Local ports (if needed):
  - Backend: 5001 
  - Frontend: 3000
  - DB: 5432
- Secrets:
  - db-secret.yaml → DB_USER and DB_PASSWORD (optional, override defaults)

1. Initialize Terraform and create EKS cluster:

    `cd terraform`  
    `terraform init`  
    `terraform apply`

2. Update kubeconfig:

    `aws eks update-kubeconfig --name devops-demo-eks --region us-east-1`

3. Deploy Kubernetes manifests:

    `kubectl apply -f kubernetes/`

4. Check pods & services  
    `kubectl get pods`  
    `kubectl get svc`

- 🌐 Frontend LoadBalancer IP → access via browser  
- 🖥️ Backend and 🗄️ DB communicate internally in the cluster  

---

## 📁 Project Structure

- `devops-demo/`  
  - `backend/` 🖥️  
  - `frontend/` 🌐  
  - `db/` 🗄️  
  - `kubernetes/` ☸️  
  - `terraform/` 🛠️  
  - `docker-compose.yaml` 🐳  

## Contributors
 - GITHUB -> [pinyopapi](https://github.com/pinyopapi)
---