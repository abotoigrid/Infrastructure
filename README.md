# Infrastructure

## 1. Infrastructure Automation

Create an infrastructure automation pipeline that prepares the environment for application deployment using the Infrastructure as Code approach. Infrastructure configuration should be in a separate repository from the application source code.

### Preparation Steps

Some preparation steps can be done manually or by running automation scripts locally:

- **Remote State Storage**: If you’re going to use Amazon S3, Azure Blob Storage, or Google Cloud Storage as a remote state storage for Terraform, it should be created in advance.
- **GitLab SaaS**: If you’re going to use GitLab SaaS (GitLab.com), you need a runner for your first job. Initially, it can be installed on your local machine.
- **Jenkins**: If you’re going to use Jenkins, then create a virtual machine, install Jenkins, and take care of agents.

### Infrastructure Provisioning Pipeline

Use GitLab or Jenkins to run the infrastructure provisioning pipeline. It should include the following jobs:

1. **Configuration Formatting**
2. **Configuration Validation and Scanning** (optional)
3. **Plan**
4. **Provisioning Resources** (manual job)
5. **Destroying Resources** (manual job)

### Resources to Create with Terraform

Use Terraform to create the following resources in the cloud:

- **Virtual Machine**: With all the needed network-related resources and a Load Balancer. This VM will be used to host the application.
- **Persistent Database**: For the application.
- **Additional Virtual Machine** (optional): With all the needed network-related resources to run additional software like GitLab runners, Nexus (if used).

### Software Installation with Ansible

Use Ansible to install additional software on the virtual machines, including:

- Docker and Docker Compose
- Jenkins with workers or GitLab runners
- Nexus (if used)

## 2. CI/CD Solution

A Continuous Integration and Continuous Delivery solution for the Java application spring-petclinic.

### Repository Requirements

The repository with the spring-petclinic application source code should additionally have configuration files for Maven or Gradle and a Dockerfile.

### Artifact Storage

Prepare a registry in the artifact storage of your choice.

### Pipeline for Merge Request (MR) or Pull Request (PR)

The pipeline should include:

1. **Static Code Analysis**
2. **Tests**
3. **Build**
4. **Creating an Artifact**: It can be tagged with a short commit hash.
5. **Pushing the Artifact**: To the artifact storage.

### Pipeline for the Main Branch

The pipeline should include:

1. **Creating a Git Tag**: In the repository using Semantic Versioning approach (a minor version increases on each commit). A Python script with [semver · PyPI](https://pypi.org/project/semver/) can be used here.
2. **Creating an Artifact**: With Git tag representing the version.
3. **Pushing the Artifact**: To the artifact storage.
4. **Manual Deployment Job**:
   - Connects to a virtual machine.
   - Checks if a previous version of the application is present and removes it.
   - Gets the image from the artifact storage.
   - Runs the application making sure it is connected to a MySQL database in the cloud.
   - Prints the link to the application.

## Monitoring (Optional)

Use a cloud-based monitoring solution to create a dashboard with resource consumption metrics for the VM where the spring-petclinic application is running.

## Architecture Diagram

Create an architecture diagram for your solution.