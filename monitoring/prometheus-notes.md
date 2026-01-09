# Prometheus Monitoring Notes (Minikube)

## Overview
Monitoring setup for local development environment with optional Prometheus and Grafana.

## Basic Monitoring (Always Available)
- Kubernetes native health checks
- kubectl commands for resource monitoring
- Basic troubleshooting scripts

## Advanced Monitoring (Optional)
Add full monitoring stack with:
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install monitoring prometheus-community/kube-prometheus-stack \
  --create-namespace --namespace monitoring
```

## Key Monitoring Points
- Pod health via liveness/readiness probes
- Resource usage with `kubectl top` (requires metrics-server)
- Application logs via `kubectl logs`
- Prometheus metrics collection (if installed)
- Grafana dashboards (if installed)

## Access Monitoring
```bash
# Grafana (admin/prom-operator)
kubectl port-forward -n monitoring svc/monitoring-grafana 3000:80

# Prometheus
kubectl port-forward -n monitoring svc/monitoring-kube-prometheus-prometheus 9090:9090
```

## Local Monitoring Commands
```bash
# Check resource usage (requires metrics-server addon)
kubectl top pods

# View application logs
kubectl logs -l app=vikunja

# Check pod status
kubectl get pods

# Describe pod issues
kubectl describe pod <pod-name>
```