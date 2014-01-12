#!/bin/bash
#
# makesymlinks.sh - Jesse Tavizon - iktome@adohi.net
#
# symlinks for .[file|directory] in ~/ to matching git sources in ~/dotfiles
#  - creates ~/dotfiles_old as a backup directory
#  - creates backup of existing dotfile for each source dotfile
#  - creates symbolic link for each source dotfile in ~/

echo

sourceDir=~/dotfiles             # dotfiles repository directory
backupDir=~/dotfiles_backup      # existing dotfiles backup directory
dotFiles="vimrc"                 # list of files/folders for symlinks

echo "Changing to the $sourceDir directory."
cd $sourceDir

# create $backupDir if needed
if ! [ -d "$backupDir" ]; then
   echo "Creating $backupDir for existing dotfiles."
   mkdir -p $backupDir
fi

# backup existing dotfiles and create symlinks
for file in $dotFiles; do    
   if [ -f ~/.$file ] && ! [ -L ~/.$file ]; then
      echo "Backing up existing .$file to $backupDir."
      mv ~/.$file $backupDir 
   fi
   if ! [ -f ~/.$file ]; then
      echo "Creating symlink to $file."
      ln -s $sourceDir/$file ~/.$file
   fi
done

echo
