[![Latest version: 4.11.1](https://img.shields.io/badge/Latest%20version-4.11.1-green.svg)][Latest version]

# Helm charts for the StackRox Kubernetes Security Platform

This repository contains Helm charts for the [StackRox Kubernetes Security
Platform](https://www.stackrox.io/) as well as [Red Hat Advanced Cluster Security](https://www.redhat.com/en/technologies/cloud-computing/openshift/advanced-cluster-security-kubernetes) (ACS). StackRox is the Open Source upstream project of ACS.

This repository is a public mirror of [stackrox/release-artifacts](https://github.com/stackrox/release-artifacts/). 
Modifications can only be done by ACS engineers in the source repository.
If you encounter any problems, open an issue in the [stackrox/stackrox](https://github.com/stackrox/stackrox/issues) repository.

## Adding the Helm repository

To use the StackRox charts, add https://raw.githubusercontent.com/stackrox/helm-charts/main/opensource/ as a repository:
```bash
$ helm repo add stackrox https://raw.githubusercontent.com/stackrox/helm-charts/main/opensource/
```

Afterwards, you can update, download, and install the available charts. For example:

- Use the `helm repo update` command to get the latest version of the charts.
- Use the `helm install --wait --namespace stackrox-operator-system --create-namespace stackrox-operator stackrox/stackrox-operator` command to install the `stackrox-operator` chart.

## Installation

For instructions on how to install the StackRox Kubernetes Security Platform using the operator Helm chart,
see [operator/install](https://github.com/stackrox/stackrox/tree/master/operator/install) in the main repository.

## Included charts

The StackRox Kubernetes Security Platform Helm charts repository includes the following charts:

1. [`stackrox-operator`](#operator-chart) - installs the StackRox operator (available since 4.11)
2. [`central-services`](#central-services-chart) (deprecated)
3. [`secured-cluster-services`](#secured-cluster-services-chart) (deprecated)

### Operator chart

The recommended way to install the StackRox Kubernetes Security Platform via Helm is by using the
`stackrox-operator` chart. This chart installs the StackRox operator, which manages the platform
components via `Central` and `SecuredCluster` custom resources.

### Central services chart (deprecated)

> [!WARNING]
> The `stackrox-central-services` chart is deprecated and will cease to be updated
> in the future. Use the [`stackrox-operator`](#operator-chart) chart instead.

The Helm chart to install StackRox Central is called `stackrox-central-services`.

The installation can be customized to your needs. Please consult the documentation at OpenShift docs for detailed configuration options:  
[Configure the central-services Helm chart](https://docs.redhat.com/en/documentation/red_hat_advanced_cluster_security_for_kubernetes/4.10/html/installing/installing-rhacs-on-other-platforms#install-using-helm-customizations-other)

### Secured cluster services chart (deprecated)

> [!WARNING]
> The `stackrox-secured-cluster-services` chart is deprecated and will cease to be
> updated in the future. Use the [`stackrox-operator`](#operator-chart) chart instead.

The chart to install per-cluster and per-node components of StackRox is called `stackrox-secured-cluster-services`.

The installation can be customized to your needs. Consult the OpenShift docs for detailed configuration options:  
[Configuring the secured-cluster-services Helm chart
](https://docs.redhat.com/en/documentation/red_hat_advanced_cluster_security_for_kubernetes/4.10/html/installing/installing-rhacs-on-other-platforms#configure-secured-cluster-services-helm-chart-customizations-other_install-secured-cluster-other)


## License

Helm charts for the [StackRox Kubernetes Security Platform](https://www.redhat.com/en/technologies/cloud-computing/openshift/advanced-cluster-security-kubernetes) are
licensed under [Apache License 2.0](./LICENSE).

[Latest version]: ./4.11.1/
