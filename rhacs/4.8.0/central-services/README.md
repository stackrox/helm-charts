# StackRox Kubernetes Security Platform - Central Services Helm Chart

This Helm chart allows you to deploy the central services of the StackRox
Kubernetes Security Platform: StackRox Central and StackRox Scanner.

If you want to install Red Hat Advanced Cluster Security, refer to
[Installing quickly using Helm charts](https://docs.openshift.com/acs/installing/installing_helm/install-helm-quick.html)
for up to date information.

## Prerequisites

To deploy the central services for the StackRox Kubernetes Security platform
using Helm, you must:
- Have at least version 3.1 of the Helm tool installed on your machine

## Add the Canonical Chart Location as a Helm Repository

The canonical repository for StackRox Helm charts is https://mirror.openshift.com/pub/rhacs/charts.
To use StackRox Helm charts on your machine, run
```sh
helm repo add stackrox https://mirror.openshift.com/pub/rhacs/charts
```
This command only needs to be run once on your machine. Whenever you are deploying
or upgrading a chart from a remote repository, it is advisable to run
```sh
helm repo update
```
beforehand.

## Deploy Central Services Using Helm

The basic command for deploying the central services is
```sh
helm install -n stackrox --create-namespace \
    stackrox-central-services stackrox/stackrox-central-services
```
If you have a copy of this chart on your machine, you can also reference the
path to this copy instead of `stackrox/stackrox-central-services` above.

In case you use image mirroring or otherwise access StackRox container images from non-standard location,
you may also need to provide image pull credentials.
There are several ways to inject the required credentials (if any) into the installation process:

- **Explicitly specify username and password:** Use this if you are using a registry that supports username/password
  authentication. Pass the following arguments to the `helm install` command:
  ```sh
  --set imagePullSecrets.username=<registry username> --set imagePullSecrets.password=<registry password>
  ```
- **Use pre-existing image pull secrets:** If you already have one or several image pull secrets
  created in the namespace to which you are deploying, you can reference these in the following
  way (we assume that your secrets are called `pull-secret-1` and `pull-secret-2`):
  ```sh
  --set imagePullSecrets.useExisting="pull-secret-1;pull-secret-2"
  ```
- **Do not use image pull secrets:** If you are pulling your images from quay.io/stackrox-io or a registry in a private
  network that does not require authentication, or if the default service account in the namespace
  to which you are deploying is already configured with appropriate image pull secrets, you do
  not need to specify any additional image pull secrets.

### Accessing the StackRox Portal After Deployment

Once you have deployed the StackRox Kubernetes Security Platform Central Services via
`helm install`, you will see an information text on the console that contains any things to
note, or warnings encountered during the installation text. In particular, it instructs you
how to connect to your Central deployment via port-forward (if you have not configured an
exposure method, see below), and the administrator password to use for the initial login.

### Applying Custom Configuration Options

This Helm chart has many different configuration options. For simple use cases, these can be
set directly on the `helm install` command line; however, we generally recommend that you
store your configuration in a dedicated file.

#### Using the `--set` family of command-line flags

This approach is the quickest way to customize the deployment, but it does not work for
more complex configuration settings. Via the `--set` and `--set-file` flags, which need to be
appended to your `helm install` invocation, you can inject configuration values into the
installation process. Here are some examples:
- **Deploy StackRox in offline mode:** This configures StackRox in a way such that it will not
  reach out to any external endpoints.
  ```sh
  --set env.offlineMode=true
  ```
- **Configure a fixed administrator password:** This sets the password with which you log in to
  the StackRox portal as an administrator. If you do not configure a password yourself, one will
  be created for you and printed as part of the installation notes.
  ```sh
  --set central.adminPassword.value=mysupersecretpassword
  ```

#### Using configuration YAML files and the `-f` command-line flag

To ensure the best possible upgrade experience, it is recommended that you store all custom
configuration options in two files: `values-public.yaml` and `values-private.yaml`. The former
contains all non-sensitive configuration options (such as whether to run in offline mode), and the
latter contains all sensitive configuration options (such as the administrator password, or
custom TLS certificates). The `values-public.yaml` file can be stored in, for example, your Git
repository, while the `values-private.yaml` file should be stored in a secrets management
system.

There is a large number of configuration options that cannot all be discussed in minute detail
in this README file. However, the Helm chart contains example configuration files
`values-public.yaml.example` and `values-private.yaml.example`, that list all the available
configuration options, along with documentation. The following is just a brief example of what
can be configured via those files:
- **`values-public.yaml`:**
  ```yaml
  env:
    offlineMode: true  # run in offline mode
  
  central:
    # Use custom resource overrides for central
    resources:
      requests:
        cpu: 4
        memory: "8Gi"
      limits:
        cpu: 8
        memory: "16Gi"
  
    # Expose central via a LoadBalancer service
    exposure:
      loadBalancer:
        enabled: true
  
  scanner:
    # Run without StackRox Scanner (NOT RECOMMENDED)
    disable: true

  scannerV4:
    # Enable Scanner V4, which will become the default scanner for StackRox.
    # Note that enabling Scanner V4 while having the StackRox Scanner disabled (scanner.disable=true)
    # is not a supported configuration.
    disable: false
  
  customize:
    # Apply the important-service=true label for all objects managed by this chart.
    labels:
      important-service: true
    # Set the CLUSTER=important-cluster environment variable for all containers in the
    # central deployment:
    central:
      envVars:
        CLUSTER: important-cluster
  ```
- **`values-private.yaml`**:
  ```yaml
  central:
    # Configure a default TLS certificate (public cert + private key) for central
    defaultTLS:
      cert: |
        -----BEGIN CERTIFICATE-----
        MII...
        -----END CERTIFICATE-----
      key: |
        -----BEGIN EC PRIVATE KEY-----
        MHc...
        -----END EC PRIVATE KEY-----
  ```

After you have created these YAML files, you can inject the configuration options into the
installation process via the `-f` flag, i.e., by appending the following options to the
`helm install` invocation:
```sh
-f values-public.yaml -f values-private.yaml
```

### Changing Configuration Options After Deployment

If you wish to make any changes to the deployment, simply change the configuration options
in your `values-public.yaml` and/or `values-private.yaml` file(s), and inject them into an
`helm upgrade` invocation:
```sh
helm upgrade -n stackrox stackrox-central-services stackrox/stackrox-central-services \
    -f values-public.yaml \
    -f values-private.yaml
```
Under most circumstances, you will not need to supply the `values-private.yaml` file, unless
you want changes to sensitive configuration options to be applied.

Alternatively, you can also use the `--reuse-values` for the `helm upgrade` command. This flag
causes values which were previously passed via `--values / -f`, `--set` or `--set-file` to be
automatically passed again to the Helm chart rendering.

### Passing Generated Values

The Helm chart can conveniently automatically generate certain sensitive data objects. This includes
passwords, keys and certificates. If these data objects were generated during the installation
of the Helm chart, a command is provided as part of the post-installation notes which can be used
for retrieving them and storing them in a file `generated-values.yaml`. This file
might contain a CA key.

If, during an upgrade of the Helm release, the Helm chart needs to generate a new certificate for
some component, it is required to pass in the existing CA, for example by adding
`-f generated-values.yaml` to the arguments for `helm upgrade`.

### Enabling Scanner V4

Beginning with StackRox 4.4, a new scanner component based on ClairCore named Scanner V4 is integrated.
In a future version of StackRox, Scanner V4 will become the new default scanner and replace the existing
scanner named StackRox Scanner. Currently, Scanner V4 is not installed by default, but it
can be enabled alongside StackRox Scanner using the following Helm chart setting:

```
scannerV4:
  disable: false
```

To enable Scanner V4 for an existing installation of this chart, the CA certificate
and its key must be provided to the `helm upgrade` command.
For example, if the CA was generated ahead of time and injected into the `helm install` command, then
the `--reuse-values` flag for `helm upgrade` can be used to provide the certificate and key. However, if the CA was
generated by the Helm chart at installation time, you must retrieve the generated secret
values from the cluster (see above) and provide those to the `helm upgrade` command.

Note that because Scanner V4 currently runs simultaneously with StackRox Scanner, your
cluster must have sufficient computing resources available to host both scanner components at the same time.
The default resource configuration for Scanner V4 components can be found in the file
internal/defaults.yaml.

### Multiple Installations of Central

Because the StackRox Central installation includes a `SecurityPolicy` custom resource definition (CRD) in its template,
only one installation can "own" the CRD.  This means that any other installation on the same cluster will fail to install if it tries to install the CRD with an error like:

    Error: INSTALLATION FAILED: Unable to continue with install:
        CustomResourceDefinition "securitypolicies.config.stackrox.io" in namespace "" exists and cannot be imported into the current release:
        invalid ownership metadata; annotation validation error: key "meta.helm.sh/release-name" must equal "my-release-name":
        current value is "stackrox-central-services"; annotation validation error:
        key "meta.helm.sh/release-namespace" must equal "my-namespace":
        current value is "stackrox"

There is an option to exclude the CRD from the template, but there are a few other concerns to be aware of when managing multiple Central installations on one cluster:

1. Upgrades to the first installation will also upgrade the CRD used by any other installation, introducing the potential for versioning mismatches.
2. Uninstallation of the first installation will remove the CRD, thus removing all custom `SecurityPolicy` resources from ALL Central installations.
3. Downgrading of the first installation could remove the CRD as well.
4. These concerns are the responsiblity of the user to handle.  Thus, multi-tenant CRD management issues are considered unsupported!

If, after understanding these risks, you still want to install multiple Central installations on the same cluster using Helm, it can be done with the following flag:

    --set allowUnsupportedMultipleCentrals=documentationWasReadAndUnderstood

Note that installing multiple Centrals is fully supported by default using the ACS operator.
