#!/bin/bash
#
# makesymlinks.sh - Jesse Tavizon - iktome@adohi.net
#
# symlinks for .[file|directory] in ~/ to matching git sources in ~/dotfiles
#  - creates ~/dotfiles_old as a backup directory
#  - creates backup of existing dotfile for each source dotfile
#  - creates symbolic link for each source dotfile in ~/

dir=~/dotfiles                   # dotfiles repository directory
olddir=~/dotfiles_old            # original dotfiles backup directory
files="vimrc"                    # list of files/folders for symlinks

echo "Changing to the $dir directory"
cd $dir

if ! [ -d "$olddir" ]; then
   echo "Creating $olddir for backup of existing dotfiles"
   mkdir -p $olddir
fi

for file in $files; do    
   if [ -f ~/.$file ] && ! [ -L ~/.$file ]; then
      echo "Backing up existing .$file to $olddir"
      mv ~/.$file $olddir 
   fi
   if ! [ -f ~/.$file ]; then
      echo "Creating symlink to $file"
      ln -s $dir/$file ~/.$file
   fi
done
