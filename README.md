# Protein DevOps Engineer Bootcamp

## Final Project

**_Built with;_**

[![alpine][#alpine]][@alpine] [![sh][#sh]][@sh] [![Vagrant][#vagrant]][@vagrant] [![gitlab][#gitlab]][@gitlab] [![gh-actions][#gh-actions]][@gh-actions] [![react][#react]][@react] [![docker][#docker]][@docker] [![terraform][#terraform]][@terraform] [![aws][#aws]][@aws] [![kubernetes][#kubernetes]][@kubernetes]

### :notebook: About

This repository contains the final project developed under the [Patika.dev][@patika] & [Protein][@protein] DevOps Engineer Bootcamp. While some directories are isolated developments, the overall purpose of the project is deploying a containerized application on optimized AWS infrastructure with the ability of Terraform using Gitlab CI/CD pipelines.

If you are looking for something specific, check out the [directory content](#openfilefolder-directory-content) first!

### :open_book: **Table of Contents**

1. [Assignment](#hash-assignment)
   - [Essential Tasks](#ballotboxwithcheck-essential-tasks)
   - [Optional Tasks](#asterisk-optional-tasks)
2. [Overview](#notebookwithdecorativecover-overview)
3. [Featured](#sparkles-featured)
4. [AWS Infrastructure](#electricplug-aws-infrastructure)
   - [Visualization](#infrastructure-visualization)
5. [Directory Content](#openfilefolder-directory-content)

#### :hash: **Assignment**

> Fully cover the DevOps cycle and create a full-on CI/CD and cloud infrastructure.

#### :ballot_box_with_check: **Essential Tasks**

> 1. Create a simple React application.
> 2. Containerize the image with the smallest possible size.
> 3. Design a Gitlab CI/CD pipeline to automate all processes.
> 4. Create the ideal VPC and implement security measures.
> 5. Create an Application Load Balancer in front of the service.
> 6. Deploy Docker image on ECS Fargate.
> 7. Deploy the application on Kubernetes.
> 8. Describe strategies and choices on related files.

#### :asterisk: **Optional Tasks**

> 1. Configure an auto-scaling on the ECS service.
> 2. Create a Cloudwatch dashboard with proper metrics.
> 3. Draw the AWS infrastructure and describe the relations between services.
> 4. Configure a self-hosted runner on Gitlab and share its configuration with the implementation steps.
> 5. Create a script that sends an email if the disk usage of the system exceeds 90% in the OS.

### :notebook_with_decorative_cover: **Overview**

The project presents an example of a fully automated DevOps CI/CD cycle with the ability to deploy on AWS infrastructure. Check out the featured section for a quick preview of the project features.

### :sparkles: **Featured**

> - Simple React application dockerized with the smallest image size. (~ 24 MB)
> - Terraform stack that is built with module composition to fully utilize AWS capabilities.
> - AWS infrastructure that implements most of the security measures and best practices.
> - Automated CI/CD main pipeline on Gitlab.
> - Simple workflow on Github to mirror this repository to Gitlab. (Also produces another Docker Image to Docker Hub for the demonstrative purposes)
> - Both pipelines are working on self-hosted runners.
> - Example project board to demonstrate Scrum framework by using Github Projects & Issues.
> - YAML templates for issues and pull requests for making data inputs easier.
> - Both pipelines are working on self-hosted runners.
> - Both pipelines are working on self-hosted runners.
> - Auxilary shell scripts and k8s deployment manifests.
> - Vagrantfile to easier build a VM test environment for shell scripts.

### :electric_plug: **AWS Infrastructure**

**_Used Services;_**

![IAM](./assets/icons/iam.svg) ![AWS Budgets](./assets/icons/budgets.svg) ![S3](./assets/icons/s3.svg) ![DynamoDB](./assets/icons/dynamodb.svg) ![VPC](./assets/icons/vpc.svg) ![ELB](./assets/icons/elb.svg) ![ECS](./assets/icons/ecs.svg) ![ECR](./assets/icons/ecr.svg) ![Fargate](./assets/icons/fargate.svg) ![Application Auto Scaling](./assets/icons/appautoscaling.svg) ![Cloudwatch](./assets/icons/cloudwatch.svg)

- Identity and Access Management
- AWS Budgets
- Simple Storage Service
- Amazon DynamoDB
- Amazon VPC
- Elastic Load Balancing
- Elastic Container Service
- Elastic Container Registry
- AWS Fargate
- Application Auto Scaling
- Amazon CloudWatch

##### _Infrastructure Visualization_

![AWS Infrastructure](./assets/img/aws_infra.svg)

### :open_file_folder: **Directory Content**

```
/           : Gitlab CI/CD parent pipeline manifest.
.github/    : Github Actions workflow manifets, issue and pull request templates.
.gitlab/    : Terraform deployment manifest, self-hosted runner configuration.
ansible/    : Simple shell script for checking the disk usage and sending email alerts.
assets/     : AWS infrastucture diagram draw.io export.
docker/     : React application, Dockerfiles for production and development environments.
k8s/        : Kubernetes deployment manifests.
terraform/  : Modular Terraform Stack featuring most AWS services.
```

<!-- View Counter -->
<p align="right"><img src="https://komarev.com/ghpvc/?username=placeholder&style=flat&label=Views&color=blue" alt="View Counter"></a></p>

<!-- Footnotes -->

[^1]: Footnotes here

<!-- Badge Index -->

[#linux]: https://img.shields.io/badge/Linux-FCC624?style=flat&logo=linux&logoColor=black
[#bash]: https://img.shields.io/badge/Bash-4EAA25?style=flat&logo=GNU%20Bash&logoColor=white
[#docker]: https://img.shields.io/badge/Docker-2CA5E0?style=flat&logo=docker&logoColor=white
[#virtualbox]: https://img.shields.io/badge/VirtualBox-183A61?style=flat&logo=virtualbox&logoColor=white
[#vagrant]: https://img.shields.io/badge/Vagrant-1868F2?style=flat&logo=vagrant&logoColor=white
[#aws]: https://img.shields.io/badge/AWS-FF9900?style=flat&logo=amazonaws&logoColor=white
[#gh-actions]: https://img.shields.io/badge/GitHub_Actions-2088FF?style=flat&logo=github-actions&logoColor=white
[#terraform]: https://img.shields.io/badge/Terraform-7B42BC?style=flat&logo=terraform&logoColor=white
[#kubernetes]: https://img.shields.io/badge/kubernetes-326ce5.svg?&style=flat&logo=kubernetes&logoColor=white
[#markdown]: https://img.shields.io/badge/Markdown-000000?style=flat&logo=markdown&logoColor=white
[#nginx]: https://img.shields.io/badge/Nginx-009639?style=flat&logo=nginx&logoColor=white
[#nodejs]: https://img.shields.io/badge/Node.js-339933?style=flat&logo=nodedotjs&logoColor=white
[#npm]: https://img.shields.io/badge/npm-CB3837?style=flat&logo=npm&logoColor=white
[#react]: https://img.shields.io/badge/React-20232A?style=flat&logo=react&logoColor=61DAFB
[#sh]: https://img.shields.io/badge/Shell_Script-4EAA25?style=flat&logo=gnu-bash&logoColor=white
[#vscode]: https://img.shields.io/badge/VSCode-0078D4?style=flat&logo=visual%20studio%20code&logoColor=white
[#alpine]: https://img.shields.io/badge/Alpine-0D597F?style=flat&logo=alpine-linux&logoColor=white
[#ubuntu]: https://img.shields.io/badge/Ubuntu-E95420?style=flat&logo=ubuntu&logoColor=white
[#gitlab]: https://img.shields.io/badge/GitLab%20CI/CD-330F63?style=flat&logo=gitlab&logoColor=white

---

<!-- URL Index -->

[@patika]: https://www.patika.dev/
[@protein]: https://protein.tech/
[@linux]: https://www.linux.org/
[@bash]: https://www.gnu.org/software/bash/
[@docker]: https://www.docker.com/
[@virtualbox]: https://www.virtualbox.org/
[@vagrant]: https://www.vagrantup.com/
[@vagrant-download]: https://www.vagrantup.com/downloads/
[@aws]: #
[@gh-actions]: #
[@terraform]: #
[@kubernetes]: #
[@markdown]: #
[@nginx]: #
[@nodejs]: #
[@npm]: #
[@react]: #
[@sh]: #
[@vscode]: #
[@alpine]: #
[@ubuntu]: #
[@github]: #
[@gitlab]: #
