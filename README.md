# Resume

Infrastructure as code, using Terraform for provisioning, Ansible for configurations and dependencies, and AWS as the infrastructure provider.

## 🔨 Project features

- Create virtual machines on EC2
- Separate your code into 2 environments, one for production and one for development
- configure machines to run a Django API automatically
- prepare an elastic infrastructure
- create a Load Balancer for your application

## ✔️ Techniques and technologies used

The following techniques and technologies are explored in this App:

- **Creation of machines in EC2**: creation of virtual machines in the EC2 environment (Elastic Compute Cloud) of AWS
- **Machine Configuration**: Automatically configure the machines using Ansible
- **Creating playbooks**: playbooks are an integral part of ansible and describe the steps to be followed
- **Separation of environments**: 2 separate environments, built automatically by Terraform, reusing code.
- **Execution of APIs**: how to start an API automatically after machine configuration
- **Creation of the load balancer**: the load balancer is a program used to distribute requests between multiple machines

## 🛠️ Open and run the project

The project was developed in VSC (Visual Studio Code), so install VSC (it may be a more recent version) and, on the home screen, look for the extensions option, or press Ctrl+Shift+X, and search for HashiCorp Terraform , so we will have the support of intellisense, making the work of writing the code faster.

Go to the folder and open the project folder. After opening the project, open a terminal, it can be the one integrated with VSC, navigate to the `infra/`, `env/prod` and `env/dev` folders and run the `terraform init` command inside them, now we have the terraform started and we can start using it. To create the infrastructure, run terraform apply in one of the Production (`env/prod`) or Development (`env/dev`) folders according to the desired environment.🏆

##  🚀 Install Terraform on arch linux

```bash
pacman -Syu terraform
```

# Push image to ECR 

## Retrieve an authentication token and authenticate your Docker client against your registry.
```bash
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <ACCOUNT-ID>.dkr.ecr.us-east-1.amazonaws.com
```

##  🐋 Build your Docker image using the following command. For information on creating a Docker file from scratch, see the instructions here.
```bash
docker build -t production .
```

## Once the build completes, tag your image so you can push it to this repository:
```bash
docker tag production:latest <ACCOUNT-ID>.dkr.ecr.us-east-1.amazonaws.com/production:latest
```

## Run the following command to push this image to the newly created AWS repository:
```bash
docker push <ACCOUNT-ID>.dkr.ecr.us-east-1.amazonaws.com/production:latest
```