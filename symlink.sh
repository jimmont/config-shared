#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd ~ 
ln -sf "$DIR/.bashrc" "$HOME/.bash_profile"
ln -sf "$DIR/.gemrc" "$HOME/.gemrc"
ln -sf "$DIR/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DIR/.gitignore" "$HOME/.gitignore"
ln -sf "$DIR/.inputrc" "$HOME/.inputrc"
ln -sf "$DIR/.screenrc" "$HOME/.screenrc"
