# Spring PetClinic with Snyk Kubenetes Monitoring
This repo uses the Spring-Petclinic application from the Spring community and instruments it for use in the Datadog Continuous Profiler. Datadog's Continuous Profiler provides software engineers, architects, and application operators with insight into an application's performance and shows reached vulnerabilities.

## Spring Petclinic deployed to Google Cloud using Kubernetes
This version of Spring Petclinic deploys to Kubernetes. The pipelines leverage GCP to create a Kubernetes cluster. See the pipeline's section below for details on each pipeline. This application can deploy to a local version of Kubernetes but will need some Ingress point.

## Pipelines
A detailed list of each pipeline with description, requirements, and how to trigger the pipeline

![Pipelines](images/github_actions_icon.png) ### Build and Push Image
![Pipelines](images/github_actions_icon.png)The pipeline builds the SPC artifact, the container image, and pushes the Image to Docker Hub. The pipeline defines the container image registry and repo in the pipeline. 

**Trigger:** On Push or PR based on directory. 
Ignored directories 
 * kubernetes/** 
 * .github/workflows/** 

**Required Secrets:** 
Docker_Key - Docker API Key

### GCP Setup
This pipeline creates a K8s cluster on GCP. It requires a service account and key with K8s admin credentials.

**Trigger:** Manual from GH Actions Tab

**Requirements:** 
GCP Service Account with K8s admin privileges

**Required Secrets:** 
* Google_Application_Credentials - Service Account Key 
* Project_ID - GCP Project Id 
* GKE_Cluster_Name - Name of K8s cluster 

### Deploy-App-K8s
This pipeline deploys the SPC application to your K8s cluster. It creates a load balancer on GCP.

**Trigger:** Manual from GH Actions Tab

**Required Secrets:**
* GKE_Cluster_Name

### GCP Tear-Down
This pipeline deletes the associated GCP load balancer and your GCP K8s cluster.

**Trigger:** Manual from GH Actions Tab






