#!/bin/bash
# SRINUTECHGURU srinu-devsecops-pipeline Project Structure Automation Script

echo "Creating the srinu-devsecops-pipeline Project Directory..."
mkdir -p srinu-devsecops-pipeline
cd srinu-devsecops-pipeline

echo "Creating Application Source Code Folder..."
mkdir -p src/app
mkdir -p src/tests

echo "Creating CI/CD Pipeline Folder..."
mkdir -p pipeline/jenkins
mkdir -p pipeline/scripts

echo "Creating Docker Folder..."
mkdir -p docker

echo "Creating Kubernetes & GitOps Manifests Folders..."
mkdir -p k8s-manifests/helm-chart/templates
mkdir -p k8s-manifests/argocd

echo "Creating essential files..."
touch src/app/main.js
touch src/tests/app.test.js
touch src/package.json
touch pipeline/jenkins/Jenkinsfile
touch docker/Dockerfile
touch k8s-manifests/helm-chart/Chart.yaml
touch k8s-manifests/helm-chart/values.yaml
touch k8s-manifests/helm-chart/templates/deployment.yaml
touch k8s-manifests/helm-chart/templates/service.yaml
touch k8s-manifests/argocd/application.yaml

echo "Creating .gitignore..."
cat <<EOF > .gitignore
node_modules/
dist/
build/
.env
*.log
coverage/
EOF

echo "Project structure successfully created!"
ls -R
