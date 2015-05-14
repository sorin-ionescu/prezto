#
# Firefox-Home-Profile (fhp) maintains profile & associated
# cache directory in a tmpfs (or zram backed) filesystem
#
# $Header: firefox-home-profile/init.zsh                 Exp $
# $Aythor: (c) 2012-2015 -tclover <tokiclover@gmail.com> Exp $
# $License: MIT (or 2-clause/new/simplified BSD)         Exp $
# $Version: 4.0 2015/05/05 21:09:26                      Exp $
#

#
# Initialize the temporary directory with an anonymous function
#
function {
	local compressor profile tmpdir zsh_hook
	zstyle -s ':prezto:module:FHP' profile 'profile'
	zstyle -s ':prezto:module:FHP' compressor 'compressor'
	zstyle -b ':prezto:module:FHP' zsh-hook 'zsh_hook'
	zstyle -s ':prezto:module:FHP' tmpdir 'tmpdir'

	# Define a little helper to handle fatal errors
	function die {
		local ret=$?
		print -P " %F{red}%2x: %F{yellow}%U%I%u:%f $argv" >&2
		return $ret
	}

	if (( $+compressor )) {
	:	${compressor:=lz4 -1 -}
		zstyle ':prezto:module:FHP' compressor "$compressor"
	}
	setopt LOCAL_OPTIONS EXTENDED_GLOB
:	${profile:=$(print $HOME/.mozilla/firefox/*.default(/N:t))}
	if [[ -z $profile ]] {
		die "Null firefox home profile"
		return 1
	}

	case $profile {
		(*.default) ;;
		(*) profile+=.default;;
	}
	zstyle ':prezto:module:FHP' profile "$profile"
	local ext=.tar.$compressor[(w)1]
:	${tmpdir:=${TMPDIR:-/tmp/$USER}}

	if (( $zsh_hook )) {
		autoload -Uz add-zsh-hook
		add-zsh-hook zshexit fhp
	}

	[[ -d "$tmpdir" ]] || mkdir -p -m 1700 "$TMPDIR" ||
	{ die "no suitable directory found"; return 2; }

	local c dir mktmp=checkpath DIR
	for dir ("$HOME"/.{,cache/}mozilla/firefox/$profile) {
		grep -q "$dir" /proc/mounts && continue
		pushd -q "$dir:h" || continue
		if [[ ! -f "$profile$ext" ]] || [[ ! -f "$profile.old$ext" ]] {
			tar -Ocp $profile | $=compressor $profile$ext ||
			{ die "failed to pack a new tarball"; continue; }
		}
		popd -q

		case "$dir" {
			(*.cache/*) c=c;;
			(*) c=p;;
		}
		(( $+commands[mktemp] )) && mktmp=$commands[mktemp]
		DIR=$($mktmp -p "$tmpdir"  -d fh${c}-XXXXXX)
		sudo mount --bind "$DIR" "$dir" ||
		{ die "failed to mount $DIR"; continue; }
	}

	#
	# Finaly, start the firefox home profile
	#
	#(( $+functions[fhp] )) || autoload -Uz fhp
	if zstyle -t ':prezto:module:FHP' decompress; then
		fhp
	fi
}

#
# vim:fenc=utf-8:ft=zsh:ci:pi:sts=2:sw=2:ts=2:
#
