#!/bin/bash

# sealed secrets key
kubectl create secret tls -n kube-system sealed-secrets-key --cert=certs/tls.crt --key=certs/tls.key 
kubectl label secret -n kube-system sealed-secrets-key sealedsecrets.bitnami.com/sealed-secrets-key=active

# install flux and bootstrap repo
flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=flux-infrastructure \
  --branch=main \
  --path=./clusters/my-cluster \
  --personal \
  --private=false