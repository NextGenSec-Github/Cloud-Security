# Access Control in namespaces
- Provisioning access to namespaced resources in a cluster is accomplished by granting a combination of IAM roles and Kubernetes' built-in role-based access control (RBAC).

- An IAM role will give an account initial access to the project while the RBAC permissions will grant granular access to a cluster's namespaced resources (pods, deployments, services, etc).

## IAM Roles

- When managing access control for Kubernetes, Identity and Access Management (IAM) is used to manage access and permissions on a higher organization and project levels.

- There are several roles that can be assigned to users and service accounts in IAM that govern their level of access with GKE. RBAC's granular permissions build on the access already provided by IAM and cannot restrict access granted by it. As a result, for multi-tenant namespaced clusters, the assigned IAM role should grant minimal access.

## Here's a list of common GKE IAM roles you can assign:

### Kubernetes Engine Admin:
- Provides access to full management of clusters and their Kubernetes API objects. A user with this role will be able to create, edit and delete any resource in any cluster and subsequent namespaces.

### Kubernetes Engine Developer
- Provides access to Kubernetes API objects inside clusters. A user with this role will be able to create, edit, and delete resources in any cluster and subsequent namespaces.

### Kubernetes Engine Cluster Admin
- Provides access to management of clusters. A user with this role will not have access to create or edit resources within any cluster or subsequent namespaces directly, but will be able to create, modify, and delete any cluster.

### Kubernetes Engine Viewer
- Provides read-only access to GKE resources. A user with this role will have read-only access to namespaces and their resources.

### Kubernetes Engine Cluster Viewer
- Get and list access to GKE Clusters. This is the minimal role required for anyone who needs to access resources within a cluster's namespaces.











