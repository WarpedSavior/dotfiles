#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# For personal use. Use at your own risk !
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc conkyrc profile Xresources config/dunst config/neofetch
	config/openbox config/tint2/unleashed config/compton.conf mpd/mpd.conf
	ncmpcpp/config scripts config/polybar vimrc"    # list of files/folders to symlink in homedir

########## Dotfiles in home

# create some folders
mkdir -p ~/.config/tint2
mkdir -p ~/.mpd
mkdir -p ~/.ncmpcpp
mkdir -p ~/.config/polybar

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done