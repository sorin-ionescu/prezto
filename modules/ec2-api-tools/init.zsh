#
# Configures aliases and adds ec2-api-tools directories to environment variables.
# Assumes brew was used to install ec2-api-tools: ```sudo brew install ec2-api-tools```.
#
# Authors:
#   Lance Speelmon <lance@speelmon.com>
#

# Return if requirements are not found.
if [[ "$OSTYPE" != darwin* ]]; then
  return 1
fi

#
# Environment
#

# ==> Caveats
# Before you can use these tools you must export some variables to your $SHELL
# and download your X.509 certificate and private key from Amazon Web Services.

# Your certificate and private key are available at:
# http://aws-portal.amazon.com/gp/aws/developer/account/index.html?action=access-key

# Download two ".pem" files, one starting with `pk-`, and one starting with `cert-`.
# You need to put both into a folder in your home directory, `~/.ec2`.
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"

#
# Aliases
#

alias ec2ii='curl -q http://169.254.169.254/latest/meta-data/instance-id'
