#!/usr/bin/env bash

for f in `ls conf`; do
  ln -sf $(pwd)/conf/$f $HOME/.$f
done
ln -sf $(pwd)/doom $HOME/.config/doom

