#! /usr/bin/env zsh

# Check for ansible
if (( ! ${+commands[ansible]} )); then
  return 1
fi

alias al=ansible-lint
alias ap=ansible-playbook
alias galactus=ansible-galaxy

if (( ${+commands[awx]} )); then
# Optional config for awxkit
# To make use of this add your Tower/AWX token to your login keychain like this:
# security add-generic-password -a $USER -s api_token -w SomeAPItoken login.keychain
	if is-darwin; then
			export CONTROLLER_TOKEN=$(security find-generic-password -a $USER -s awx_token -w login.keychain)
	fi
	export TOWER_FORMAT=human
	export TOWER_HOST=https://awx
	export TOWER_VERIFY_SSL=true
	export TOWER_USERNAME=$USER
fi
