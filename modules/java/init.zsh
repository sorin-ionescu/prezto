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

# Preset Java environment variables in OS X if they are available.
# The actual JAVA_HOME can be conveniently overriden as so:
#   export JAVA_HOME=$JAVA_HOME_17
if [[ "$OSTYPE" == darwin* ]]; then

  jdks=("1.5" "1.6" "1.7" "1.8")
  for jdk in "${jdks[@]}"; do
    /usr/libexec/java_home -v "${jdk}" 2> /dev/null >&2
    if (( $? == 0 )); then
      export JAVA_HOME_$(echo "${jdk}" | tr -d '.')="$(/usr/libexec/java_home -v "${jdk}" 2> /dev/null)"
    fi
  done

  export JAVA_HOME=${JAVA_HOME_17:-$(/usr/libexec/java_home 2> /dev/null)}
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
