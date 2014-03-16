#!/bin/bash

set -e
set -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function mv_next_file {
    local source=$1
    local target=$2
    local i=0
    if [[ -e $target ]] ; then
        i=0
        while [[ -e $name-$i.ext ]] ; do
            let i++
        done
        target=$target-$i
    fi
    mv -f $source $target
}

if [[ -f ~/.vimrc ]]
then
    mv_next_file ~/.vimrc ~/vimrc.bkk
fi
ln -sf $DIR/.vimrc ~/.vimrc
cd $DIR && git submodule update --init
cd $DIR && bash update.sh

