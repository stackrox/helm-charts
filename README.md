[![Latest version: 3.67.2](https://img.shields.io/badge/Latest%20version-3.67.2-green.svg)][Latest version]

# Helm charts for the StackRox Kubernetes Security Platform

This repository contains Helm charts for the [StackRox Kubernetes Security
Platform](https://www.stackrox.com/platform/). These Helm charts are published here for reference.
You can also get these charts from our Helm chart server at https://charts.stackrox.io/.

To use these charts, add https://charts.stackrox.io/ as a repository:
```bash
$ helm repo add stackrox https://charts.stackrox.io/
```

Afterward, you can update, download, and install the available charts. For example:

- Use the `helm repo update` command to get the latest version of the charts.
- Use the `helm pull stackrox/sensor` command to download the `sensor` chart.
- Use the `helm install stackrox/central-services` command to install the `central-services` chart.

## Included charts

The StackRox Kubernetes Security Platform Helm charts repository includes the following charts:

1. [`central-services`](#central-services-chart)
1. [`secured-cluster-services`](#secured-cluster-services-chart) (version 3.0.55.0 and newer)
1. [`sensor`](#sensor-chart) (version 3.0.54.0 and older)

### Central services chart

The Helm chart to install StackRox Central is called `central-services`. This chart is only
available for the StackRox Kubernetes Security Platform version 3.0.50.0 and newer.

> **NOTE**
>
> 1. The Central services chart for the StackRox Kubernetes Security Platform version 3.0.50.x is
>    published in the [`3.0.50.x-central-services`](./3.0.50.0-central-services) directory.
> 1. There is no Central services chart available for the StackRox Kubernetes Security Platform
>    version 3.0.49 and older.

The Central services chart for the StackRox Kubernetes Security Platform version 3.0.51 and newer
are published in the `central-services/` sub-directory of the respective version directory.

For example, to install Central using Helm charts for the StackRox Kubernetes Security Platform
version 3.0.51.0, view the instructions in the
[`3.0.51.0/central-services`](./3.0.51.0/central-services/) directory.

### Secured cluster services chart

> **IMPORTANT**
>
> We publish Helm charts with every new release of the StackRox Kubernetes Security Platform. Make
> sure that you use a version that matches the StackRox Kubernetes Security Platform version you've
> installed.

> **NOTE**
>
> You can use the secured cluster services chart if you are running version 3.0.55.0 or newer
> of the StackRox Kubernetes Security Platform. If you are running an older version, please use
> the [sensor chart](#sensor-chart) described below.

The secured cluster services charts for the StackRox Kubernetes Security Platform version 3.0.55 and
newer are published in the `secured-cluster-services/` sub-directory of the respective version
directory.

For example, to install  Sensor, Collector, and Admission Controller using Helm charts for the
StackRox Kubernetes Security Platform version 3.0.55.0, view the instructions in the
[`3.0.55.0/secured-cluster-services`](./3.0.55.0/secured-cluster-services) directory.

### Sensor chart

> **NOTE**
>
> We have discontinued the sensor Helm chart. The last version of the StackRox Kubernetes Security
> Platform for which you can use this chart is version 3.0.54.0. If you are using a newer version,
> please use the [secured cluster services chart](#secured-cluster-services-chart) described above.

After [installing StackRox
Central](https://install.stackrox.com/docs/get-started/quick-start-helm/), you can use the Sensor
Helm chart to install Sensor, Collector, and Admission Controller. You can use Sensor Helm chart
independently of the installation method you've chosen to install Central.

> **IMPORTANT**
>
> We publish Helm charts with every new release of the StackRox Kubernetes Security Platform. Make
> sure that you use a version that matches the StackRox Kubernetes Security Platform version you've
> installed.

> **NOTE**
>
> The Sensor chart for the StackRox Kubernetes Security Platform version 3.0.50 and older are
> published in the main version directory.

The Sensor chart for the StackRox Kubernetes Security Platform version 3.0.51 and newer are
published in the `sensor/` sub-directory of the respective version directory.

For example, to install  Sensor, Collector, and Admission Controller using Helm charts for the
StackRox Kubernetes Security Platform:
- version 3.0.50.1, view the instructions in [`3.0.50.1`](./3.0.50.1) directory.
- version 3.0.51.0, view the instructions in the [`3.0.51.0/sensor`](./3.0.51.0/sensor) directory.

## Installation

For instructions on how to install the StackRox Kubernetes Security Platform with these Helm charts,
see [Quick Start (Helm)](https://install.stackrox.com/docs/get-started/quick-start-helm/).

## License

Helm charts for the [StackRox Kubernetes Security Platform](https://www.stackrox.com/platform/) are
licensed under [Apache License 2.0](./LICENSE).


[Latest version]: ./3.67.2/