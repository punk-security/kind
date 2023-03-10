#!/bin/bash
docker pull busybox

# Add images here for them to be available at runtime
# for example:
# docker pull quay.io/kubernetes-ingress-controller/nginx-ingress-controller:0.9.0

#setup certs
mkdir /punk

openssl genrsa -out /punk/punk.key 2048
openssl req -new -key /punk/punk.key -out /punk/punk.csr -subj "/CN=punk/O=punk"
openssl x509 -req -in /punk/punk.csr -CA /var/lib/minikube/certs/ca.crt -CAkey /var/lib/minikube/certs/ca.key -CAcreateserial -out  /punk/punk.crt -days 500
#TODO remove ca key to prevent token minting
