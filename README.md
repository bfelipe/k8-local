# K8 local

The intention of K8 local is to simplify the setup of kubernetes localy in your dev machine or bare metal server.

## Setup & Installation for Kubernetes and Ingress

There are a couple steps to be follow to actually install k8 locally.
First things first, we should to install minikube and kubectl. Both works as environment and command line interface to communicate with kubernetes.
To do that, simply execute:

    ./setup.sh

**Importante:** If necessary, you should turn all scripts into executable scripts. You can achieve that by typing:

    chmod +x script-name.sh

Once the setup is finished, we are going to enable ingress to our cluster.

    ./setup_ingress_nginx_controller.sh

Now we are going to install kubernetes dashboard, so we can actually handle kubernetes using a user interface:

    ./k8_dashboard.sh

If you wish to initiate the dashboard server, you can simply execute:

    ./k8_dashboard_server_starter.sh

The server requires a token for each access. You can get one using the script:

    ./k8_access_token.sh

## Finally

Now you have kubernetes and kubeless running locally.
If you desire, you can actually setup minikube to auto restart with the machine, by using:

    ./minikube_auto_start.sh

So you do not need to use the command bellow to start your cluster anymore:

    minikube start

Also, the setup.sh script will going to install kubernetes v1.17.11. But you can also change it using a specify version of kubernetes.


## To Do

- Add Knative scripts and configs
- Add Faas scripts and configs
- Add Apache openWhisk  scripts and configs

## Author

Bruno Felipe
