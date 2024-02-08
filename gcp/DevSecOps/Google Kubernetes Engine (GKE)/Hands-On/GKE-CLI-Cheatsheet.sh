# ==================
# GKE CLI Cheatsheet
# ==================

# Setting the Zone to us-east1-c. You can change this to your desired zone.
export ZONE=us-east1-c

gcloud config set compute/zone ${ZONE} 

gcloud container clusters get-credentials multi-tenant-cluster

# You can get a full list of the current cluster's namespaces with:
kubectl get namespace

# For a complete list of namespaced resources:
kubectl api-resources --namespaced=true

# This will output all services in the kube-system namespace:
kubectl get services --namespace=kube-system

# Create a namespace:
kubectl create namespace your-namespace

# Run the following to deploy a pod in your desired namespace:
kubectl run app-server --image=centos --namespace=your-namespace

# List pods in a specific namespace
kubectl get pods --namespace=team-a

# List all pods
kubectl get pods -A

# Use kubectl describe to see additional details on pods in a namespace:
kubectl describe pod your-pod --namespace=your-namespace

# To work exclusively with resources in one namespace, you can set it once in the kubectl context
kubectl config set-context --current --namespace=your-namespace







