#
# Enables local Java module installation on Mac OS X and defines related aliases.
#
# Authors:
#   Indrajit Raychaudhuri <irc@indrajit.com>
#

# Return if requirements are not found.
if (( ! $+commands[java] )); then
  return 1
fi

#
# Local Module Installation
#

# Add manually installed jenv to path.
if [[ -s "$HOME/.jenv/bin/jenv" ]]; then
  path=("$HOME/.jenv/bin" $path)
fi

# Enable shims and autocompletion if jenv is available.
if (( $+commands[jenv] )); then
  eval "$(jenv init -)"
fi

# Preset Java environment variables in OS X if they are available.
# The actual JAVA_HOME can be conveniently overriden as so:
#   export JAVA_HOME=$JAVA_HOME_17
if [[ "$OSTYPE" == darwin* ]]; then
  _jdks=(1.{5..8} 9)
  for _jdk in "${_jdks[@]}"; do
    _java_home="$(/usr/libexec/java_home -v "${_jdk}" 2> /dev/null)"
    if (( $? == 0 )); then
      # TODO: 'jenv add' and 'jenv rehash' at startup
      # jenv add "$_java_home"
      export JAVA_HOME_${_jdk#1.}="$_java_home"
    fi
  done

  export JAVA_HOME=${JAVA_HOME_18:-$(/usr/libexec/java_home 2> /dev/null)}

  unset _jdks
fi

#
# Aliases
#

# General
alias jcp='java -cp'
alias jjar='java -jar'

# Maven
if (( $+commands[mvn] )); then
  alias mt='mvn -T2'
  alias mci='mvn clean install'
  alias mtci='mvn -T2 clean install'
  alias mcv='mvn clean verify'
  alias mtcv='mvn -T2 clean verify'
fi
