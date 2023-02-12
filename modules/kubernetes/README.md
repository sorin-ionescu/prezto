# `Kubernetes` Aliases and Utilities

Enhances `Kubernetes` command line integration by providing aliases,
functions and by exposing repository status information to prompts.

## Aliases

- `kb` is an alias for `kubectl`
- `kba` is an alias for `kubectl apply`
- `kbc` is an alias for `kubectl config`
- `kbcg` is an alias for `kubectl get-contexts`
- `kbcu` is an alias for `kubectl use-context`
- `kbcv` is an alias for `kubectl config view`
- `kbC` is an alias for `kubectl create`
- `kbC` is an alias for `kubectl create`
- `kbD` is an alias for `kubectl delete`
- `kbd` is an alias for `kubectl describe`
- `kbe` is an alias for `kubectl exec`
- `kbf` is an alias for `kubectl port-forward`
- `kbg` is an alias for `kubectl get`
- `kbl` is an alias for `kubectl logs`
- `kblf` is an alias for `kubectl logs --follow`.
- `kbr` is an alias for `kubectl run`
- `kbn` is a function for `kubectl config set-context $(kubectl config current-context) --namespace=$1`
- `wkb` is a function for `watch -n 1 kubectl`

[1]: https://kubernetes.io/
