#! /usr/bin/env zsh

# Check for ansible
if (( ! ${+commands[ansible]} )); then
  return 1
fi

alias ap=ansible-playbook
alias galactus=ansible-galaxy

if (( ${+commands[ansible-lint]} )); then
	alias al=ansible-lint
fi

if (( ${+commands[awx]} )); then
# Optional config for awxkit
# To make use of this add your Tower/AWX token to your login keychain like this:
# security add-generic-password -a $USER -s api_token -w SomeAPItoken login.keychain
	if is-darwin; then
		export CONTROLLER_TOKEN=$(security find-generic-password -a $USER -s awx_token -w login.keychain)
	fi
fi

if (( ${+commands[ara]} )); then
# Reasonably modern ara module installation, which implies callback plugin availability
	export ANSIBLE_CALLBACK_PLUGINS="$(python3 -m ara.setup.callback_plugins)"
fi
