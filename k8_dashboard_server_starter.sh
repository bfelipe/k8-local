#!/bin/bash

read -p "Please enter a port number where kubernetes dashboard should be available: " PORT_NUMBER

echo "If everything is alright, you can access kubernetes dashboard at: "
echo "http://localhost:$PORT_NUMBER/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/"


kubectl proxy --port=$PORT_NUMBER
