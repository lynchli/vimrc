#!/bin/sh
VIMHOME=~/.vim

warn() {
    echo "$1" >&2
}

die() {
    warn "$1"
    exit 1
}

[ -e "$VIMHOME/vimrc" ] && die "$VIMHOME/vimrc already exists."
[ -e "~/.vim" ] && die "~/.vim already exists."
[ -e "~/.vimrc" ] && die "~/.vimrc already exists."

git clone https://github.com/lynchli/vimrc.git "$VIMHOME"
cd "$VIMHOME"
git update --init

cd ..
ln -s .vim/vimrc .vimrc

echo "vimrc is installed."
