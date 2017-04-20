# silently falls back to '' if homebrew is not installed
_autoenv_base=$(brew --prefix 2>/dev/null)

zstyle -s ':prezto:module:autoenv' script "_autoenv_script" || _autoenv_script=${_autoenv_base}/opt/autoenv/activate.sh

if [[ -s $_autoenv_script ]]; then
    source $_autoenv_script
    unset _autoenv_script
    unset _autoenv_base
else
    unset _autoenv_script
    unset _autoenv_base
    return 1
fi
