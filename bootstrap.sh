#!/bin/bash
set -e

DIR=$(cd `dirname $0` && pwd)

if [ ! -d $HOME/.bash-it ]; then
  git clone https://github.com/ba1ash/bash-it.git $HOME/.bash-it
fi

for config in `ls -1A $DIR/configs`
do
  ln -nfs $DIR/configs/$config $HOME/$config
done
