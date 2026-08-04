
#srinu-devsecops-nodejs-project

srinu-devsecops-pipeline/
├── .gitignore
├── setup_project.sh
├── sonar-project.properties
├── README.md
├── src/
│   ├── app/
│   │   └── main.js
│   ├── tests/
│   │   └── app.test.js
│   └── package.json
├── docker/
│   └── Dockerfile
├── pipeline/
│   └── jenkins/
│       └── Jenkinsfile
└── k8s-manifests/
    ├── argocd/
    │   └── application.yaml
    └── helm-chart/
        ├── Chart.yaml
        ├── values.yaml
        └── templates/
            ├── deployment.yaml
            └── service.yaml

Deploy this exclusively on Amazon Elastic Kubernetes Service (AWS EKS), here is how the files we just created interact with the AWS Cloud:

AWS Load Balancers via service.yaml: In the Helm chart, we set the service type to LoadBalancer. 
When Argo CD deploys this manifest to your AWS EKS cluster, AWS will automatically detect it and provision 
an external AWS Application Load Balancer (ALB) or Classic Load Balancer (CLB) so the internet can access your app.

Argo CD on EKS: Argo CD will be installed directly onto your EKS cluster. It sits inside AWS, securely reaching out 
to your GitHub repository to read the helm-chart folder and instantly updating your EKS Pods.

Jenkins on AWS EC2: Your Jenkinsfile will run on an AWS EC2 instance. It will pull the code, build it, scan it, 
and push it to your DockerHub (srinurkt).


