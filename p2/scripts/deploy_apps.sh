#!/bin/bash

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Deploying Applications..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Wait a bit for K3s to be fully ready
sleep 10

# Deploy all applications
echo "Deploying App 1..."
kubectl apply -f /vagrant/confs/app1.yaml

echo "Deploying App 2..."
kubectl apply -f /vagrant/confs/app2.yaml

echo "Deploying App 3..."
kubectl apply -f /vagrant/confs/app3.yaml

echo "Deploying Ingress..."
kubectl apply -f /vagrant/confs/ingress.yaml

echo ""
echo "Waiting for pods to be ready..."
kubectl wait --for=condition=Ready pod --all --timeout=180s

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Deployment Status:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

echo ""
echo "📦 PODS:"
kubectl get pods -o wide

echo ""
echo "🔌 SERVICES:"
kubectl get services

echo ""
echo "🌐 INGRESS:"
kubectl get ingress

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  ✅ Deployment Complete!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Access the applications:"
echo "  • App 1: http://app1.com"
echo "  • App 2: http://app2.com (3 replicas!)"
echo "  • App 3: http://192.168.56.110 (default)"
echo ""
echo "Don't forget to add to your /etc/hosts:"
echo "  192.168.56.110  app1.com app2.com"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"