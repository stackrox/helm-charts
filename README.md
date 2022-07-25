[![Latest version: 3.71.0](https://img.shields.io/badge/Latest%20version-3.71.0-green.svg)][Latest version]

# Helm charts for the StackRox Kubernetes Security Platform

This repository contains Helm charts for the [StackRox Kubernetes Security
Platform](https://www.stackrox.io/) as well as [Red Hat Advanced Cluster Security](https://www.redhat.com/en/technologies/cloud-computing/openshift/advanced-cluster-security-kubernetes) (ACS). StackRox is the Open Source upstream project of ACS. 


To use the StackRox charts, add https://raw.githubusercontent.com/stackrox/helm-charts/main/opensource/ as a repository:
```bash
$ helm repo add stackrox https://raw.githubusercontent.com/stackrox/helm-charts/main/opensource/
```

Afterwards, you can update, download, and install the available charts. For example:

- Use the `helm repo update` command to get the latest version of the charts.
- Use the `helm install stackrox/stackrox-central-services` command to install the `central-services` chart.
- Use the `helm pull stackrox/stackrox-secured-cluster-services` command to download the `secured-cluster-services` chart.


## Installation

For instructions on how to install the StackRox Kubernetes Security Platform with these Helm charts,
see [Quick Start (Helm)](https://github.com/stackrox/stackrox#quick-installation-via-helm).


To install ACS, follow the [OpenShift docs Helm quick Install Guide](https://docs.openshift.com/acs/installing/installing_helm/install-helm-quick.html).

## Included charts

The StackRox Kubernetes Security Platform Helm charts repository includes the following charts:

1. [`central-services`](#central-services-chart)
2. [`secured-cluster-services`](#secured-cluster-services-chart)

### Central services chart

The Helm chart to install StackRox Central is called `stackrox-central-services`.

The installation can be customized to your needs. Please consult the documentation at OpenShift docs for detailed configuration options:  
[Configure the central-services Helm chart](https://docs.openshift.com/acs/installing/installing_helm/install-helm-customization.html#configure-central-services-helm-chart)

### Secured cluster services chart

The chart to install per-cluster and per-node components of StackRox is called `stackrox-secured-cluster-services`.

The installation can be customized to your needs. Consult the OpenShift docs for detailed configuration options:  
[Configuring the secured-cluster-services Helm chart
](https://docs.openshift.com/acs/installing/installing_helm/install-helm-customization.html#configure-secured-cluster-services-helm-chart)


## License

Helm charts for the [StackRox Kubernetes Security Platform](https://www.stackrox.com/platform/) are
licensed under [Apache License 2.0](./LICENSE).


[Latest version]: ./3.71.0/
