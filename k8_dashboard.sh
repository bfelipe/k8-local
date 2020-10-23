#!/bin/bash

kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.4/aio/deploy/recommended.yaml

kubectl apply -f config/local-dashboard-adminuser.yml
kubectl apply -f config/local-cluster-roles-binding-admin.yml
