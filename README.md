# K8 local

This project has a bunch of shell scripts to install and configure kubernetes locally and with addition of kuberless framework to run lambda functions inside kubernetes and kubernetes dashboard.

## Setup & Installation

There is no secret. All files are self descriptive.

You can check each of them before run it.

You must set all .sh files as executable before. If you don't do that, you will face a message like the one bellow:

    'permission denied: ./file_name.sh'

 To do that just execute

    chmod +x file_name.sh

Once you do that, you can execute them like that:

    ./file_name.sh

## To Do:

I still want to add additional scripts so you can test different frameworks to handle lambda functions with kubernetes like fission, open fass and openwhisk.

## Issues with ingress.yml

For some reason while using k8 on minikube, when you trying to expose your applications using ingress you can face an error:

    Error from server (InternalError): error when creating "ingress.yml": Internal error occurred: failed calling webhook "validate.nginx.ingress.kubernetes.io": Post https://ingress-nginx-controller-admission.kube-system.svc:443/extensions/v1beta1/ingresses?timeout=30s: x509: certificate signed by unknown authority (possibly because of "x509: ECDSA verification failure" while trying to verify candidate authority

As a proper solution, most people suggest you to expose 8443 por from master node to your pods.
Because we just use minukube to handle our k8 for local development, you can just remove ValidatingWebhookConfiguration and try to apply your ingress.yml again. To do that you should execute:

    kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission

## Author

Bruno Felipe
