#!/bin/bash

# Kör testerna först
echo "Kör tester..."
if ./script/run_tests.sh; then
    echo "Testerna lyckades. Bygger och distribuerar applikationen..."

    # Bygg Docker-bilden
    echo "Bygger Docker-bilden..."
    docker build -t min_applikation -f infra/docker/Dockerfile .

    # Spara Docker-bilden som en tar-fil
    echo "Sparar Docker-bilden som en tar-fil..."
    docker save -o infra/docker/min_applikation.tar min_applikation

    # Starta Kubernetes Deployment och Service
    echo "Applicerar Kubernetes Deployment och Service..."
    kubectl apply -f infra/kubernetes/deployment.yaml
    kubectl apply -f infra/kubernetes/service.yaml

    echo "Applikationen är nu distribuerad och exponerad via Kubernetes."
else
    echo "Testerna misslyckades. Bygg- och distributionsprocessen avbruten."
    exit 1
fi
