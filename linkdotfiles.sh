#!/bin/bash
#
# makesymlinks.sh - Jesse Tavizon - iktome@adohi.net
#
# symlinks for .[file|directory] in ~/ to matching git sources in ~/dotfiles
#  - creates a backup directory for existing dotfiles
#  - moves existing dotfiles to the backup directory
#  - creates a symbolic link in ~/ for each source dotfile

sourceDir=~/dotfiles             # dotfiles source directory
backupDir=~/dotfiles_backup      # existing dotfiles backup directory
dotFiles="vimrc"                 # list of source files/folders for symlinks

echo
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
echo "Dotfile configuration complete."
echo
