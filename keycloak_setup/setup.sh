#!/bin/bash

source ./env.sh

# Assumes cluster already exists

gcloud container clusters get-credentials $CLUSTER_NAME --region $CLUSTER_REGION --project $PROJECT_ID

### GKE Gateway
### Pointing to an already known External IP Address and Cert (pre-setup) as HTTPS is pre-req for Keycloak
kubectl apply -f network/gateway.yaml

### Postgres
kubectl apply -f postgres/storageclass.yaml
kubectl apply -f postgres/postgres-secrets.yaml
kubectl apply -f postgres/postgress-statefulset.yaml

### Keycloak
kubectl apply -f keycloak/keycloak.yaml