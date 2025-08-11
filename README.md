# End-to-End Machine Learning Project

This repository contains a **fully modular End-to-End Machine Learning Project** designed to **predict student performance**. 
It covers the entire lifecycle — starting from the **data ingestion pipeline**, through **ETL processes**, **model training**, and **evaluation**, 
to **deployment** with **CI/CD** using **Docker** for containerization and deploy using **Azure** web app ,**AWS** EC2.
---

## 📦 Environment Setup

### Create Virtual Environment (using Conda)
```bash
conda create -p venv python=3.10 -y
```

### Activate Virtual Environment
```bash
conda activate venv
```
Or, if using an absolute path:
```bash
conda activate "D:\Personal Project_certificate work Space(Projects )\ML_project_repo\venv"
```

---

## 📚 Install Dependencies
```bash
pip install -r requirements.txt
```

---

## 🚀 CI/CD with EC2

### 1️⃣ Initial Setup
```powershell
icacls .\flask-key.pem /inheritance:r
icacls .\flask-key.pem /grant:r "${env:USERNAME}:(R)"
```
Connect to EC2 instance:
```bash
ssh -i "flask-key.pem" ubuntu@<public_ipv4_address>
```

Update packages:
```bash
sudo apt update && sudo apt upgrade -y
```

### 2️⃣ Create Virtual Environment on EC2
```bash
sudo apt install python3 python3-pip python3-venv git -y
python3 --version
pip3 --version
```

---

### 3️⃣ Clone Repository & Setup
```bash
git clone https://github.com/Binuda-Dewhan/ML_project.git
cd ML_project
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

---

### 4️⃣ Run the Application
```bash
python app.py
```

---

### (Optional) Run Flask in Background with `nohup`
```bash
nohup python application.py &
```
To stop Flask:

**If running in foreground** → Press `CTRL + C`  
**If running in background** → Find and kill process:
```bash
ps aux | grep python
kill <PID>
```

---

## ☁️ Azure Deployment (CI/CD)

1. Go to **Azure Portal** → Create **Azure Web App**
2. Fill in:
   - Resource Group
   - App Service Plan
   - Web App Name
   - Runtime Stack → Python
3. Under **Deployment**, select **GitHub** and provide repository name
4. Click **Review + Create**

---

## 🐳 Docker Deployment with Azure Container Registry

### Build Docker Image
```bash
docker build -t testdockerbinu.azurecr.io/mltest:latest .
```

### Login to Azure Container Registry
```bash
docker login testdockerbinu.azurecr.io
```

### Push Image
```bash
docker push testdockerbinu.azurecr.io/mltest:latest
```

---

## 📄 Notes
- Replace `<public_ipv4_address>` with your actual EC2 instance IP.
- Make sure **requirements.txt** file is correct and up to date.
- Ensure you have **Docker** and **Azure CLI** installed for container deployment.
