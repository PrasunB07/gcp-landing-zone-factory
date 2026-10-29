# GIT REPO STRUCTURE
## GitHub Organization: google.cloud.msgcp
This git organization will host terraform sources for Google Cloud Foundations.
NOTE: The following repositories should be created and applied in order ( TOP to BOTTOM)

## Repository:

### 1. msgcp-bootstrap-org:
## Pre-Requisties
1. Create a manual seed project using Google Cloud Console  
2. Create a Service Account with the following permissions  
>> - Project Creator  
>> -  Service Account Admin  
>> -  Workload Identity Pool Admin  
>> -  Workload Identity User
>> -  Organization Admin  
>
3. Create Workload Identity Pool and provider and attach Service Account to the Workload Identity Pool  
>> - Configure Attribute mapping depending on the services being used with the Workload Provider (ie.github, Terraform Cloud)
>> - For security configure the provider features such as Allowed Audience, Attribute Condition  
>
4. (OPTIONAL): Create GCS bucket depending on state file management with KMS protection  
1. This repo creates a bootstrap folder and project with the required API services and required bootstrap service account with necessary permissions.
2. This repo creates the Workforce Identity Pool and Provider for OIDC configurations
3. This repo creates the Workload Identity Pool and Provider and the Bootstrap Service Account is attached
4. This repo creates a GCS bucket for TFC state files and is wrapped with KMS key protection

### 2. msgcp-iam-org:
1. Service Account creation for each repo and/or terraform workspace
2. Workload Identity Pool creation
3. Workload Identity Provider creation for each repo and/or terraform workspace with corresponding Service Account attached

### 3. msgcp-resource-org 
1. Org-Foundation repo sets up folder hierarchy and required security settings through organizational policies at the organization and folder level of all Neighborhoods
2. This repo also creates Secure tag and key values

### 4. msgcp-host-project: 
This repo creates the following Networking functionality for shared hub networks and host projects
1. VPC
2. Network Peering
3. Interconnect
4. Routes
5. DNS
5. Shared VPC
6. Shared Organization level logging
7. Host and shared project creation

### 5. msgcp-service-project:
This repo creates a landing zone project within a Parent folder and sets the following resources
1. Project Service Account with Project and Subnet level permission
2. Subnets
3. Shared VPC
4. DNS
5. Routes
6. GKE cluster 

### 6. msgcp-vpn-org: 
1. This repo contents all VPN connections

### 7. msgcp-firewall-policies: 
1. Firewall repo is used to setup hierarchical firewall policies at the organization level to target resources to allow/deny, ingress/egress connections
2. Firewall repo is used to setup global/regional network firewall policies at the project/vpc level to target resources to allow/deny, ingress/egress connections utilizing secure tags
3. IP Based network firewall policies NOT preferred so validations have been created to block out all ip address driven scenarios(Secure Tag driven rules)

### 8. msgcp-firewall-rules:
1. Firewall repo is used to setup firewall rules at the project/vpc level to target resources to allow/deny, ingress/egress connections
2. IP Based firewall rules NOT preferred so validations have been created to block out all ip address driven scenarios.(Network Tag driven rules)

### msgcp-terraform-modules:
This repo will host terraform modules for GCP cloud foundations. It includes all customized modules.
1. These private modules will be hosted in one git repo
2. These modules will be connected to Terraform cloud for business registry and will be published to terraform registry as private modules. 
>    1. Budget Factory Module
    2. Custom Roles Factory Module
    3. Hierarchy Firewall Policy Factory Module
    4. Network Firewall Policy Factory Module
    5. Firewall Rules Factory Module
    6. Folder Factory Module
    7. GKE Factory Module
    8. KMS Module
    8. Monitoring Alert Factory Module
    9. Monitoring Dashboard Module
    10. Monitoring Scope Factory Module
    11. Monitoring Channel Factory Module
    12. Organization Policy Factory Module
    13. Project Factory Module
    14. Route Factory Module
    15. Service Account Factory Module
    16. Subnet Factory Module
    17. Tag Factory Module
    18. Workload Identity Provider Factory Module
    19. GKE Vault Integration
    20. Flux Github Integration
    21. Flux Helm Integration
    22. Flux Image Integration
>
