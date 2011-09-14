# Install local gems according to Mac OS X conventions.
if [[ "$OSTYPE" == darwin* ]]; then
  export GEM_HOME=$HOME/Library/Ruby/Gems/1.8
  export PATH=$GEM_HOME/bin:$PATH

  # gem is slow; cache its output.
  cache_file="${0:h}/cache.zsh"
  if [[ ! -f "$cache_file" ]]; then
    echo export GEM_PATH=$GEM_HOME:$(gem env gempath) >! "$cache_file"
    source "$cache_file"
  else
    source "$cache_file"
  fi
  unset cache_file
fi

# Loads RVM into the shell session.
completion_file="${0:h}/_rvm"
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm"

  # Complete rvm.
  if [[ ! -e "$completion_file" ]]; then
    ln -f -s "$rvm_path/scripts/zsh/Completion/_rvm" "$completion_file" 2> /dev/null
  fi
else
  if [[ -L "$completion_file" ]]; then
    unlink "$completion_file" 2> /dev/null
  fi
fi
unset completion_file

# Loads rbenv into the shell session.
if [[ -s "$HOME/.rbenv/bin/rbenv" ]]; then
  path=("$HOME/.rbenv/bin" $path)
  eval "$(rbenv init -)"
fi

