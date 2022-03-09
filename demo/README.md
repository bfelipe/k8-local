Sync local registry to minikube:

    minikube docker-env
    eval $(minikube -p minikube docker-env)

Build app image:

    docker build -t bbc-news-api .


Important notes about ingress object sintaxe:

networking.k8s.io/v1beta1 == 1.14 to 1.18
networking.k8s.io/v1 = 1.19+

'Ingress' and 'IngressClass' resources have graduated to 'networking.k8s.io/v1'. Ingress and IngressClass types in the 'extensions/v1beta1' and 'networking.k8s.io/v1beta1' API versions are deprecated and will no longer be served in 1.22+
Persisted objects can be accessed via the 'networking.k8s.io/v1' API. Notable changes in v1 Ingress objects (v1beta1 field names are unchanged):
- 'spec.backend' -> 'spec.defaultBackend'
- 'serviceName' -> 'service.name'
- 'servicePort' -> 'service.port.name' (for string values)
- 'servicePort' -> 'service.port.number' (for numeric values)
- 'pathType' no longer has a default value in v1; "Exact", "Prefix", or "ImplementationSpecific" must be specified
Other Ingress API updates:
- backends can now be resource or service backends
- 'path' is no longer required to be a valid regular expression

For api v1
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: bbc-news-api-ing
  namespace: default
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /$1
spec:
  rules:
    - host: news.io
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: bbc-news-api-svc
                port:
                  number: 8080

Once you did the deployment you can now get ingress ip for your application by using:

  kubectl get ingress

The follow output shold appear:

  NAME               CLASS    HOSTS     ADDRESS                  PORTS   AGE
  bbc-news-api-ing   <none>   news.io   xxx.xxx.xxx.xxx          80      5m1s

If for some reason there is no IP given for you application ingress you can use the same IP from minikube

  minikube ip

Now you can go into your /etc/hosts and add at the bottom of the file your ingress IP or minikube IP followed by the host dns you registered for your application

  /etc/hosts

  xxx.xxx.xxx.xxx news.io

You can access your app by going into the same dns now from your browser.