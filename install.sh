home_dir=${ZDOTDIR:-$HOME}
prezto_dir="$home_dir/.zprezto"

hash zsh 2>/dev/null || { 
  echo "Zsh, isn't installed on your system, you're going to need to install that first."
  exit 1
}

if [ -d $prezto_dir ]
then
  echo "Prezto already installed, exiting installation."
  exit
fi

echo ""
echo "Git cloning Prezto into $prezto_dir"
hash git 2>/dev/null && /usr/bin/env git clone --recursive https://github.com/sorin-ionescu/prezto.git $prezto_dir || {
  echo "git not installed"
  exit 1
}

echo ""
setopt EXTENDED_GLOB
for rcfile in "$home_dir"/.zprezto/runcoms/^README.md(.N); do
  dest="$home_dir/.${rcfile:t}"
  if [ -f $dest ] || [ -h $dest ]
  then
    backup="$dest.prezto_backup"
    echo "Backing up $dest to $backup"
    mv $dest $backup
  fi
  echo "Linking $rcfile to $dest"
  ln -s $rcfile $dest
done

echo ""
echo "Copying your current PATH and adding it to the end of ~/.zshrc"
echo "export PATH=$PATH" >> ~/.zshrc


echo ""
echo "You can ensure $USER's default shell is set to zsh with 'chsh -s \`which zsh\`'"

echo ""
echo "Prezto is now installed. Login into, or reload zsh to activate."

echo ""