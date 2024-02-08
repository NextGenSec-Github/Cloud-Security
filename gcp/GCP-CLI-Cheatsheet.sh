# ===================
# GCP CLI Cheatsheet
# ===================

# Authenticate with GCP
gcloud auth login  # Authenticate with your Google Cloud Platform account

# Set project
gcloud config set project PROJECT_ID  # Set the default GCP project ID

# List GCP projects
gcloud projects list  # List all projects associated with the authenticated account

# List GCP services
gcloud services list  # List all available GCP services

# Create a Compute Engine VM instance
gcloud compute instances create INSTANCE_NAME \
    --zone=ZONE \
    --machine-type=MACHINE_TYPE \
    --image=IMAGE \
    --boot-disk-size=BOOT_DISK_SIZE_GB # Create a VM instance with specified parameters

# List Compute Engine instances
gcloud compute instances list  # List all Compute Engine VM instances

# SSH into a Compute Engine VM instance
gcloud compute ssh INSTANCE_NAME  # SSH into a Compute Engine VM instance

# Create a Cloud Storage bucket
gsutil mb gs://BUCKET_NAME  # Create a Cloud Storage bucket

# Upload a file to Cloud Storage
gsutil cp LOCAL_FILE_PATH gs://BUCKET_NAME  # Upload a file to a Cloud Storage bucket

# List objects in a Cloud Storage bucket
gsutil ls gs://BUCKET_NAME  # List objects in a Cloud Storage bucket

# List logs in Cloud Logging
gcloud logging logs list  # List all logs in Cloud Logging

# Tail logs in Cloud Logging
gcloud logging tail LOG_NAME  # Tail logs for a specific log in Cloud Logging

# Create a Cloud SQL instance
gcloud sql instances create INSTANCE_NAME \
    --database-version=DATABASE_VERSION \
    --tier=TIER \
    --region=REGION # Create a Cloud SQL instance

# List Cloud SQL instances
gcloud sql instances list  # List all Cloud SQL instances

# Connect to Cloud SQL instance
gcloud sql connect INSTANCE_NAME  # Connect to a Cloud SQL instance

# Create a Cloud Function
gcloud functions deploy FUNCTION_NAME \
    --runtime=RUNTIME \
    --trigger-event=TRIGGER_EVENT \
    --trigger-resource=TRIGGER_RESOURCE \
    --entry-point=ENTRY_POINT \
    --source=SOURCE_CODE_LOCATION # Deploy a Cloud Function

# List Cloud Functions
gcloud functions list  # List all Cloud Functions

# Create a Kubernetes cluster
gcloud container clusters create CLUSTER_NAME \
    --num-nodes=NUM_NODES \
    --zone=ZONE # Create a Kubernetes cluster

# List Kubernetes clusters
gcloud container clusters list  # List all Kubernetes clusters

# Get Kubernetes cluster credentials
gcloud container clusters get-credentials CLUSTER_NAME --zone=ZONE # Get credentials for a Kubernetes cluster

# Deploy an application to Kubernetes
kubectl apply -f MANIFEST_FILE  # Deploy an application to a Kubernetes cluster

# Scale a Kubernetes deployment
kubectl scale deployment DEPLOYMENT_NAME --replicas=NUM_REPLICAS  # Scale a Kubernetes deployment

# Delete a Kubernetes cluster
gcloud container clusters delete CLUSTER_NAME --zone=ZONE # Delete a Kubernetes cluster

# Delete a Cloud Function
gcloud functions delete FUNCTION_NAME # Delete a Cloud Function

# Delete a Cloud SQL instance
gcloud sql instances delete INSTANCE_NAME # Delete a Cloud SQL instance

# Delete a Compute Engine VM instance
gcloud compute instances delete INSTANCE_NAME --zone=ZONE # Delete a Compute Engine VM instance

# Delete a Cloud Storage bucket
gsutil rm -r gs://BUCKET_NAME # Delete a Cloud Storage bucket

# Revoke authentication
gcloud auth revoke  # Revoke authentication with Google Cloud Platform

# Additional resources and documentation:
# - Google Cloud SDK documentation: https://cloud.google.com/sdk/docs
# - Google Cloud CLI reference: https://cloud.google.com/sdk/gcloud/reference
# - Google Cloud Platform documentation: https://cloud.google.com/docs
