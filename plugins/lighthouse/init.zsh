# Add a .lighthouse file into your directory with the URL to the
# individual project.
#
# For example:
#   https://rails.lighthouseapp.com/projects/8994
#
# Screencast:
#   http://screencast.com/t/ZDgwNDUwNT

function open-lighthouse-ticket() {
  if [[ ! -f .lighthouse-url ]]; then
    echo "There is no .lighthouse-url file in the current directory..."
    return 0;
  else
    local lighthouse_url=$(cat .lighthouse-url);
    echo "Opening ticket #$1";
    open "${lighthouse_url}/tickets/$1";
  fi
}

alias olt='open-lighthouse-ticket'

