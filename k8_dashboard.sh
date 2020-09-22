#!/bin/bash

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.4/aio/deploy/recommended.yaml

read -p "Please enter a port number where kubernetes dashboard should be available: " PORT_NUMBER

kubectl proxy --port=$PORT_NUMBER

echo "K8 UI Dashboard available at: "
echo "http://localhost:$PORT_NUMBER/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/"

kubectl apply -f config/local-dashboard-adminuser.yml
kubectl apply -f config/local-cluster-roles-binding-admin.yml
