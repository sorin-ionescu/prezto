#
# Provides 'kubectl' aliases and utiities.
#
# Authors:
#   Bruno Miguel Custodio <brunomcustodio@gmail.com>
#

# Return if requirements are not found.
if (( ! ${+commands[kubectl]} )); then
  return 1
fi

# Enable completion for 'kubectl'.
cache_file="${0:h}/cache.zsh"
kubectl_command="${commands[kubectl]}"

if [[ "${kubectl_command}" -nt "${cache_file}" || ! -s "${cache_file}" ]]; then
  ${kubectl_command} completion zsh >! "${cache_file}" 2> /dev/null
fi

source "${cache_file}"
unset cache_file kubectl_command

#
# Aliases
#

alias kc='kubectl'

alias kca='kubectl apply'
alias kcc='kubectl create'
alias kcD='kubectl delete'
alias kcd='kubectl describe'
alias kce='kubectl exec'
alias kcf='kubectl port-forward'
alias kcg='kubectl get'
alias kcl='kubectl logs'
alias kcr='kubectl run'

alias kclf='kubectl logs --follow'
