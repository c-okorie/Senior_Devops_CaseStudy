#!/bin/bash

echo "=== Vikunja Kubernetes Troubleshooting ==="

# Check if metrics-server is available
echo "0. Checking metrics-server..."
kubectl get pods -n kube-system | grep metrics-server || echo "metrics-server not found - enable with: minikube addons enable metrics-server"

# Check pod status
echo "1. Checking pod status..."
kubectl get pods -l app.kubernetes.io/name=vikunja

# Check services
echo "2. Checking services..."
kubectl get svc -l app.kubernetes.io/name=vikunja

# Check ingress
echo "3. Checking ingress..."
kubectl get ingress -l app.kubernetes.io/name=vikunja

# Check logs
echo "4. Recent logs from main app..."
kubectl logs -l app.kubernetes.io/component=app --tail=20

echo "5. Recent logs from database..."
kubectl logs -l app.kubernetes.io/component=database --tail=20

# Check resource usage (if metrics-server available)
echo "6. Resource usage..."
kubectl top pods -l app.kubernetes.io/name=vikunja 2>/dev/null || echo "Resource metrics unavailable - enable metrics-server addon"

# Check persistent volumes
echo "7. Persistent volumes..."
kubectl get pv,pvc -l app.kubernetes.io/name=vikunja

# Check monitoring stack (if installed)
echo "8. Checking monitoring stack..."
kubectl get pods -n monitoring 2>/dev/null || echo "Monitoring stack not installed"

echo "=== Troubleshooting Complete ==="