#!/bin/bash
#
# makesymlinks.sh
# symlinks for .[file|directory] in ~/ to matching git sources in ~/dotfiles

# Variables
dir=~/dotfiles                   # dotfiles directory
olddir=~/dotfiles_old            # original dotfiles backup directory
files="vimrc"                    # list of files/folders to symlink

echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file."
    ln -s $dir/$file ~/.$file
done
