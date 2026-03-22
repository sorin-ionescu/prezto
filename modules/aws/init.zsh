#
# Integrates the AWS CLI into the shell environment.
#
# Authors:
#   David Tagatac <david@tagatac.net>
#

# Return if requirements are not found.
if (( ! $+commands[aws] )); then
  return 1
fi

# Load AWS CLI completions.
if (( $+commands[aws_completer] )); then
  autoload -Uz bashcompinit && bashcompinit
  complete -C aws_completer aws
fi
