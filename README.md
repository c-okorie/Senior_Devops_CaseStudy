# Vikunja Kubernetes Deployment (Minikube)

## Overview
This project demonstrates a production-ready Kubernetes deployment of the Vikunja ToDo application using Helm.

## Architecture
- Vikunja API (Deployment + HPA)
- PostgreSQL (StatefulSet)
- Ingress for traffic routing
- ConfigMaps & Secrets
- Resource limits & probes

## Prerequisites
- Docker
- Minikube
- Helm

## Setup
```bash
minikube start
minikube addons enable ingress
helm install vikunja ./helm/vikunja
