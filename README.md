# Helm charts for the StackRox Kubernetes Security Platform

After you [install StackRox Central](https://help.stackrox.com/docs/get-started/quick-start/#install-stackrox-central),
you can use helm charts to install Sensor, Collector, and Admission Controller.

> **IMPORTANT**
>
> We publish Helm charts with every new release of the StackRox Kubernetes
> Security Platform. Make sure to use a version that matches the version of the
> StackRox Kubernetes Security Platform you've installed.

For example, to install  Sensor, Collector, and Admission Controller using Helm
charts for the StackRox Kubernetes Security Platform version 3.0.41.4, view the
instructions in the
[`3.0.41.4` directory](https://github.com/stackrox/helm-charts/tree/master/3.0.41.4).

Beginning with [version 3.0.45.0](https://help.stackrox.com/docs/release-notes/45/#helm-charts):
* We’ve added the ability to make secret creation for the sensor, collector, and admission controller optional when deploying using Helm charts.
* We’ve added support for [offline mode](https://help.stackrox.com/docs/configure-stackrox/offline-mode/) for [Helm charts](https://help.stackrox.com/docs/release-notes/41/#helm-chart-support-for-secured-clusters).

## License

Helm charts for the [StackRox Kubernetes Security Platform](https://www.stackrox.com/platform/)
are licensed under [Apache License 2.0](./LICENSE).
