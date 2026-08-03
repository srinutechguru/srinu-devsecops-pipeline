
#srinu-devsecops-nodejs-project

srinu-devsecops-pipeline/
├── .gitignore                          # Prevents sensitive files (passwords/modules) from going to GitHub
├── setup_project.sh                    # The automation script to create this exact folder structure
│
├── src/                                # PHASE 1: Application Source Code
│   ├── app/
│   │   └── main.js                     # The Node.js web server logic
│   ├── tests/
│   │   └── app.test.js                 # Unit tests to validate the app works before building
│   └── package.json                    # Node.js dependencies and run commands
│
├── docker/                             # PHASE 1: Containerization
│   └── Dockerfile                      # Instructions to pack the app securely for DockerHub (srinurkt)
│
├── pipeline/                           # PHASE 1: CI/CD Automation
│   └── jenkins/
│       └── Jenkinsfile                 # The "Brains" - Automates building, SAST, OWASP, Trivy, and pushing
│
└── k8s-manifests/                      # PHASE 2: Kubernetes & GitOps (AWS EKS Target)
    ├── argocd/
    │   └── application.yaml            # Tells Argo CD to watch GitHub and sync to AWS EKS
    └── helm-chart/
        ├── Chart.yaml                  # Helm configuration and versioning
        ├── values.yaml                 # The "Control Center" - Jenkins updates the image tag here!
        └── templates/
            ├── deployment.yaml         # Tells EKS how many Pods to run using the srinurkt image
            └── service.yaml            # Tells EKS to create an AWS Load Balancer to route traffic


Deploy this exclusively on Amazon Elastic Kubernetes Service (AWS EKS), here is how the files we just created interact with the AWS Cloud:

AWS Load Balancers via service.yaml: In the Helm chart, we set the service type to LoadBalancer. 
When Argo CD deploys this manifest to your AWS EKS cluster, AWS will automatically detect it and provision 
an external AWS Application Load Balancer (ALB) or Classic Load Balancer (CLB) so the internet can access your app.

Argo CD on EKS: Argo CD will be installed directly onto your EKS cluster. It sits inside AWS, securely reaching out 
to your GitHub repository to read the helm-chart folder and instantly updating your EKS Pods.

Jenkins on AWS EC2: Your Jenkinsfile will run on an AWS EC2 instance. It will pull the code, build it, scan it, 
and push it to your DockerHub (srinurkt).


