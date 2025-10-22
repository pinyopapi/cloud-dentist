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
## 📦 or AWS ECR Deployment

1. Creating ECR for backend/frontend
    `aws ecr create-repository --repository-name devops-demo-backend`    
    `aws ecr create-repository --repository-name devops-demo-frontend`

2. Auth docker with ECR(change region/account id)

    `aws ecr get-login-password --region <aws_region> | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.<aws_region>.amazonaws.com`

1. Build and Push

    `docker build -t devops-demo-backend ./backend`  
    `docker tag devops-demo-backend:latest <aws_account_id>.dkr.ecr.<aws_region>.amazonaws.com/`  
    `devops-demo-backend:latest`  
    `docker push <aws_account_id>.dkr.ecr.<aws_region>.amazonaws.com/devops-demo-backend:latest`  

---

### Before running the project, update the following placeholders in the files:
- Replace "example" with your **DockerHub** or **AWS id** in:
  - backend-deployment.yaml
  - example:
    - Docker:  `image: docker_hub_username/devops-demo-backend:latest`
    - AWS: `image: 123456789012.dkr.ecr.eu-central-1.amazonaws.com/devops-demo-backend:latest`
  - frontend-deployment.yaml
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


## 🚀 Roadmap / Future Development

Here are some planned improvements and features for the DevOps Demo project:

### ☁️ Cloud & Infrastructure
- Move DB to AWS RDS for fully cloud-based setup
- Implement Kubernetes ConfigMaps and Secrets for configuration
- Add Horizontal Pod Autoscaling (HPA) for backend & frontend
- Add basic logging/monitoring

### 🐳 Docker & Deployment
- Automate image build & push to AWS ECR
- Optional: setup GitHub Actions for CI/CD pipeline

## 🧭 Troubleshooting / Common Issues

Here are some common issues you might encounter when running the DevOps Demo project, and how to fix them.

### 🔹 AWS ECR Authentication
**Problem:** Docker cannot push/pull images to ECR.  
**Solution:** Make sure you are logged in:

aws ecr get-login-password --region <aws_region> | docker login --username AWS --password-stdin <aws_account_id>.dkr.ecr.<aws_region>.amazonaws.com

Replace `<aws_region>` and `<aws_account_id>` with your values.

---

### 🔹 Kubernetes EXTERNAL-IP Not Showing
**Problem:** LoadBalancer IP remains `<pending>`.  
**Solution:**  
- Wait a few minutes, AWS needs time to provision the ELB.  
- Check service status: `kubectl describe svc frontend`  

---

### 🔹 Database Connection Errors
**Problem:** Backend cannot connect to DB.  
**Solution:**  
- Verify your DB credentials in `.env` or `terraform.tfvars`.  
- If using local Docker Compose, ensure the DB container is up: `docker-compose ps`  

---

### 🔹 Port Conflicts
**Problem:** Frontend or backend fails to start.  
**Solution:**  
- Change the default ports in `docker-compose.yaml` (avoid port 5000 on MacOS).  

---

### 🔹 Terraform Apply Issues
**Problem:** `terraform apply` fails.  
**Solution:**  
- Make sure AWS CLI is configured with correct credentials.  
- Check for missing required variables in `terraform.tfvars`.  


## Contributors
 - GITHUB  [pinyopapi](https://github.com/pinyopapi)
---