#!/bin/bash

# Bygg Docker-bilden
echo "Bygger Docker-bilden..."
docker build -t min_applikation -f infrastruktur/docker/Dockerfile .

# Spara Docker-bilden som en tar-fil
echo "Sparar Docker-bilden som en tar-fil..."
docker save -o infrastruktur/docker/min_applikation.tar min_applikation

# Starta Kubernetes Deployment och Service
echo "Applicerar Kubernetes Deployment och Service..."
kubectl apply -f infrastruktur/kubernetes/deployment.yaml
kubectl apply -f infrastruktur/kubernetes/service.yaml

echo "Applikationen är nu distribuerad och exponerad via Kubernetes."
