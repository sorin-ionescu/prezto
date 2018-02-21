#
# Add command suggestion for kubectl
#
# Authors:
#   Duy Pham <phamthaibaoduy@live.com>
#

if (( $+commands[kubectl] )); then
  source <(kubectl completion zsh)
fi
