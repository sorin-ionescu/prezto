#!/usr/bin/env bash

mkdir -p $HOME/bin
for f in `ls bin`; do
  ln -sf $(pwd)/bin/$f $HOME/bin/$f
done
