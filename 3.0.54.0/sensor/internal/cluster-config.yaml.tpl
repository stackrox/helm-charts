{{- if ._rox.clusterName }}
clusterName: {{ ._rox.clusterName }}
{{- end }}
clusterConfig:
  staticConfig:
    type: {{ if ._rox.env.openshift -}} OPENSHIFT_CLUSTER {{- else -}} KUBERNETES_CLUSTER {{- end }}
    mainImage: {{ coalesce ._rox.image.main._abbrevImageRef ._rox.image.main.fullRef }}
    collectorImage: {{ coalesce ._rox.image.collector._abbrevImageRef ._rox.image.collector.fullRef }}
    centralApiEndpoint: {{ ._rox.centralEndpoint }}
    collectionMethod: {{ ._rox.collector.collectionMethod }}
    admissionController: {{ ._rox.admissionControl.enable }}
    admissionControllerUpdates: {{ ._rox.admissionControl.listenOnUpdates }}
    tolerationsConfig:
      disabled: {{ ._rox.collector.disableTaintTolerations }}
    slimCollector: {{ ._rox.collector.slimMode }}
  dynamicConfig:
    admissionControllerConfig:
      enabled: {{ ._rox.admissionControl.dynamic.enforce }}
      timeoutSeconds: {{ ._rox.admissionControl.dynamic.timeout }}
      scanInline: {{ ._rox.admissionControl.dynamic.scanInline }}
      disableBypass: {{ ._rox.admissionControl.dynamic.disableBypass }}
      enforceOnUpdates: {{ ._rox.admissionControl.dynamic.enforceOnUpdates }}
    registryOverride: {{ ._rox.registryOverride }}
  configFingerprint: {{ ._rox._configFP }}
