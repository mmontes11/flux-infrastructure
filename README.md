# flux-infrastructure

[Flux](https://fluxcd.io/) proof of concept for bootstraping core infrastructure and the tenants that sit on top of it.

### Getting started

1. Create a new cluster with [KIND](https://kind.sigs.k8s.io/):
```bash
./scripts/kind.sh
``` 

2. Place your TLS certificate and private key at in the `certs/` directory.

3. Fork this repository and then execute this commands to install Flux and bootstrap the cluster:
```bash
export GITHUB_USER=<user>
export GITHUB_TOKEN=<personal-access-token>
./scripts/bootstrap.sh
``` 

### Clusters

The current setup supports bootstrapping multiple clusters just by adding `Kustomization` resources on the [clusters](./clusters) folder.

### Infrastructure

Core infrastructure will be reconciled respecting the order of the dependencies defined in the [infrastructure](./infrastructure) folder:
- [sources](./infrastructure/sources): `GitRepository` and `HelmRepository` CRDs used by Flux
- [rbac](./infrastructure/rbac): Common role based access control resources
- [nginx](https://github.com/kubernetes/ingress-nginx): Ingress controller to handle the `Ingress` resources
- [sealed-secrets](https://github.com/bitnami-labs/sealed-secrets): Sealed secrets controller to manage `SealedSecret` CRDs

### Tenants

A tenant is a set of resources deployed on top of the core infrastructure in multiple clusters. They can be configured by adding `Kustomization` resources on the [tenants](./tenants) folder:
- [podinfo](https://github.com/mmontes11/flux-tenant-podinfo): Example Go application