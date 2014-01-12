#!/bin/bash
#
# makesymlinks.sh - Jesse Tavizon - iktome@adohi.net
# symlinks for .[file|directory] in ~/ to matching git sources in ~/dotfiles

# Variables
dir=~/dotfiles                   # dotfiles directory
olddir=$dir/dotfiles_old            # original dotfiles backup directory
files="vimrc"                    # list of files/folders to symlink

echo -n "Changing to the $dir directory"
cd $dir
echo "done"

echo -n "Creating $olddir for backup of any existing dotfiles in ~/"
mkdir -p $olddir
echo "done"

for file in $files; do
    echo "Backing up existing .$file in ~/ if needed"
    mv ~/.$file $olddir 
    echo "Creating symlink to $file."
    ln -s $dir/$file ~/.$file
done
