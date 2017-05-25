#
# firefox home profile (fhp) module to maintain the profile
# in a tmpfs or zram backed filesystem
#
# $Header: firefox-profile/init.zsh                      Exp $
# $Aythor: (c) 2011-2014 -tclover <tokiclover@gmail.com> Exp $
# $License: MIT (or 2-clause/new/simplified BSD)         Exp $
# $Version: 2.0 2014/09/25 21:09:26                      Exp $
#

setopt EXTENDED_GLOB
setopt NULL_GLOB

zstyle -s ':prezto:module:firefox-profile' profile 'profile'
zstyle -s ':prezto:module:firefox-profile' compressor 'compressor'
zstyle -b ':prezto:module:firefox-profile' zsh-hook 'zsh_hook'
zstyle -s ':prezto:module:firefox-profile' zramdir 'zramdir'

if [[ -z "$compressor" ]] {
:	${compressor:=lz4 -1 -}
	zstyle ':prezto:module:firefox-profile' compressor "$compressor"
}

:	${profile:=${$(print $HOME/.mozilla/firefox/*.default(/)):t}}
if [[ -z $profile ]] {
	unset compressor profile zramdir zsh_hook
	die "null firefox home profile"
	return
}

[[ ${profile%.default} == $profile ]] && profile+=.default
zstyle ':prezto:module:firefox-profile' profile "$profile"

if (( $zsh_hook )) {
	autoload -Uz add-zsh-hook
	add-zsh-hook zshexit fhp
}

# Initialize the temporary directory with an anonymous function
function {
	local ext=.tar.$compressor[(w)1]
	local fhpdir="$HOME"/.mozilla/firefox/$profile
:	${TMPDIR:=/tmp/$USER}

	[[ -n $zramdir ]] || [[ -d "$TMPDIR" ]] || mkdir -p -m1700 "$TMPDIR"
	if (( $? )) {
		die "no suitable directory found"
		return
	}

	mount | grep -q "$fhpdir" && return
	
	if [[ ! -f "$fhpdir$ext" ]] || [[ ! -f "$fhpdir.old$ext" ]] {
		pushd -q "$fhpdir:h" || return
		tar -Ocp $profile | $=compressor $profile$ext
		if (( $? )) {
			die "failed to pack a new tarball"
			return
		}
		popd -q
	}

	local mktmp=mktmp mntdir
	(( $+commands[mktemp] )) && mktmp=$commands[mktemp]

	[[ -n $zramdir ]] &&
		mntdir=$($mktmp -d "$zramdir"/fhp-XXXXXX) ||
		mntdir=$($mktmp -d "$TMPDIR"/fhp-XXXXXX)

	sudo mount --bind "$mntdir" "$fhpdir"
	if (( $? )) {
		die "failed to mount $mntdir"
		return
	}
}

# Finaly, start the firefox home profile
#(( $+functions[fhp] )) || autoload -Uz fhp
if zstyle -t ':prezto:module:firefox-profile' start-profile; then
	fhp
fi

unset compressor profile zramdir zsh_hook

#
# vim:fenc=utf-8:ft=zsh:ci:pi:sts=2:sw=2:ts=2:
#
