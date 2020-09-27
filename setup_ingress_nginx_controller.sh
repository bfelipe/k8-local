#!/bin/bash

minikube addons enable ingress

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.35.0/deploy/static/provider/baremetal/deploy.yaml

# Ingress usually take about 2 minutes to get up. You can look it status by using the command bellow.
# kubectl get pods -n ingress-nginx -l app.kubernetes.io/name=ingress-nginx --watch

# Ref https://kubernetes.github.io/ingress-nginx/deploy/#minikube
