#!/usr/bin/env bash

source .env

echo "gcp-project-id=${PROJECT_ID}"
echo "region=${REGION}"

gcloud config set project ${PROJECT_ID}
gcloud config set compute/zone ${ZONE}
gcloud config set compute/region ${REGION}


echo "Starting ---- GKE cluster for core-apps ----"

# create a GKE cluster if not available
gcloud container clusters create ${CLUSTER_NAME} \
                      --region ${REGION} \
                      --project ${PROJECT_ID} \
                      --num-nodes 3

# configure kubectl command w/ K8s cluster !
kubectl cluster-info

echo "Starting ---- GKE cluster for CI/CD stack ----"
#toDo: implement here