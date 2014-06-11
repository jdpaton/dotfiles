#!/bin/bash

set -e
set -x

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR_POWERLINE="${HOME}/.powerline"
DIR_VIM="${DIR}/vim"

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
    echo "backing up ${source} to ${target}"
    mv -f $source $target
}

# Vim
if [[ -f ~/.vimrc ]]
then
    mv_next_file ~/.vimrc ~/vimrc.bkk
fi
ln -sf "${DIR_VIM}/vimrc" ~/.vimrc
ln -sf "${DIR_VIM}" ~/.vim
cd ~/.vim && git submodule update --init
cd "${DIR_VIM}" && git submodule foreach git pull origin master

# Powerline
if [ ! d "${DIR_POWERLINE}" ]
then
    git clone git://github.com/Lokaltog/powerline ~/.powerline
else
    pushd "${DIR_POWERLINE}"
    git pull origin develop
    popd
fi

# Zsh
if [ ! -d ~/.oh-my-zsh ]
then
    curl -L http://install.ohmyz.sh | sh
else
    pushd  ~/.oh-my-zsh
    bash tools/upgrade.sh
    popd
fi

if [[ -f ~/.zshrc ]]
then
    mv_next_file ~/.zshrc ~/zshrc.bkk
fi
ln -sf $DIR/zsh/zshrc ~/.zshrc

# Tmux
ln -sf $DIR/tmux.conf $HOME/.tmux.conf

echo
echo "-~ Install the fonts at ${DIR}/powerline-fonts ~-"
echo
