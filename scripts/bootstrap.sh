#!/bin/bash

flux bootstrap github \
  --owner=$GITHUB_USER \
  --repository=flux-bootstrap \
  --branch=main \
  --path=./clusters/my-cluster \
  --personal \
  --private=false