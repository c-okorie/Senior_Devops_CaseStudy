#!/bin/bash

echo "=== Vikunja Kubernetes Troubleshooting ==="

# Check if metrics-server is available
echo "0. Checking metrics-server..."
kubectl get pods -n kube-system | grep metrics-server || echo "metrics-server not found - enable with: minikube addons enable metrics-server"

# Check pod status using correct labels
echo "1. Checking pod status..."
kubectl get pods -l app=vikunja
kubectl get pods -l app=postgres

# Check services using correct labels
echo "2. Checking services..."
kubectl get svc -l app=vikunja
kubectl get svc -l app=postgres

# Check ingress
echo "3. Checking ingress..."
kubectl get ingress

# Check logs using correct labels
echo "4. Recent logs from main app..."
kubectl logs -l app=vikunja --tail=20

echo "5. Recent logs from database..."
kubectl logs -l app=postgres --tail=20

# Check resource usage (if metrics-server available)
echo "6. Resource usage..."
kubectl top pods 2>/dev/null || echo "Resource metrics unavailable - enable metrics-server addon"

# Check persistent volumes
echo "7. Persistent volumes..."
kubectl get pv,pvc

# Check HPA
echo "8. Checking HPA..."
kubectl get hpa

# Check monitoring stack (if installed)
echo "9. Checking monitoring stack..."
kubectl get pods -n monitoring 2>/dev/null || echo "Monitoring stack not installed"

echo "=== Troubleshooting Complete ==="