# kube-index

This is a _very_ simple Go app designed to run on Kubernetes. It will pull a
list of ingresses and display them in a nice index (with design ripped from
[hello-kubernetes](https://github.com/threadproc/hello-kubernetes)).

## Deployment

You will need to create a `ServiceAccount` for this deployment, ie:
```
apiVersion: v1
kind: ServiceAccount
metadata:
  name: kube-index
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: kube-index
rules:
- apiGroups: ["networking.k8s.io"]
  resources: ["ingresses"]
  verbs: ["list"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: kube-index
subjects:
- kind: ServiceAccount
  name: kube-index
  namespace: default
roleRef:
  kind: ClusterRole
  name: kube-index
  apiGroup: rbac.authorization.k8s.io
```

then set `serviceAccountName: kube-index` on the pod spec in your deployment.