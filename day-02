# AWS_Cloud_apprentice_lv_1

AWS cloud build using IAC using terraform-automation

AWS Infrastructure Automation with Terraform
This project demonstrates a systematic approach to deploying a secure, scalable AWS environment. It covers the complete lifecycle from initial identity management to automated network provisioning.

Deployment Workflow
1. Identity & Access Management (IAM)
Before writing code, I established a secure foundation following AWS best practices:

    Root Account Hardening: Accessed the AWS environment via the Root user to initialize the account.
    Administrative User Creation: Created a dedicated IAM Admin User to avoid using the Root account for daily tasks.
    Policy Assignment: Attached the AdministratorAccess managed policy to the Admin user, granting full permissions for infrastructure management.

2. Local Environment Configuration
Prepared the local workstation to communicate with the AWS Cloud:

    Security Credentials: Generated a unique Access Key ID and Secret Access Key for the Admin user via the AWS IAM Console.
    AWS CLI Integration: Configured the local environment using the aws configure command to securely store credentials.
    Terraform Initialization: Set up the Terraform AWS Provider in VS Code to bridge the gap between code and cloud.

3. Automated Infrastructure (The "Code")
Using HashiCorp Terraform, I defined the following resources in main.tf:

    Virtual Private Cloud (VPC): Established a custom network with a 10.0.0.0/16 CIDR block.
    Multi-Tier Subnetting:
        Public Subnets: Configured with map_public_ip_on_launch = true for web-facing resources.
        Private Subnets: Isolated segments for secure backend data, ensuring no direct internet exposure.
   
Security Group Orchestration:

  Developed a "Firewall-as-Code" using aws_vpc_security_group_ingress_rule.
  Implemented strict ingress rules for SSH (Port 22) and HTTP (Port 80) to maintain a high security posture.

How to Run

  
  Run terraform init to download the provider plugins.
  Run terraform fmt to format the code for indentation
  Run terraform validate to check for any syntactical errors before running terraform plan command.
  Run terraform plan to preview the infrastructure.
  Run terraform apply -auto-approve to deploy the environment to AWS.
  Run terraform destroy to delete the existing aws resouces so as to avoid any unnecessary charges the infrastructure.
