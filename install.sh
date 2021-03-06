#!/usr/bin/env bash

# cd to this directory
# bash install.sh

### PARAMETERS
### Based loosely on https://github.com/dotphiles/dotsync/
## Install Location
if [[ -z "$DOTFILES" ]]; then
  DOTFILES=".dotfiles"
  DOTFILEDIR="$HOME/$DOTFILES"
fi
CONFIG=""
BACKUPDIR="$HOME/.backup/${DOTFILES//^\.//}"

# Get the location of this script
# http://www.ostricher.com/2014/10/the-right-way-to-get-the-directory-of-a-bash-script/
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# echo $DIR
# echo $(pwd)
# echo $DOTFILES


## FUNCTIONS

checkdirs()
{
  if [[ ! -e $BACKUPDIR ]]; then
    mkdir -p $BACKUPDIR
  fi
}

symlink ()
{
  if [[ -e "$2" ]] && [[ ! -h "$2" ]]; then
    checkdirs
    BACKUP="$BACKUPDIR/$(basename "$2")"
    echo "*** $2 already exists, backing up in $BACKUP ***"
    cp -r "$2" "$BACKUP"
    rm -rf "$2"
    ln -s "$1" "$2"
    if [[ "$2" == "$HOME/.ssh" ]]; then
      if [[ -f $BACKUP/ssh/known_hosts ]]; then
        cp "$BACKUP/ssh/known_hosts" "$2/"
      elif [[ -f $BACKUPDIR.old/ssh/known_hosts ]]; then
        cp "$BACKUPDIR.old/ssh/known_hosts" "$2/"
      fi
    fi
  elif [[ -e "$2" ]]; then
    rm -f "$2"
    ln -s "$1" "$2"
  else
    ln -s "$1" "$2"
  fi
}

link_dotfiles_dir ()
{
  # Check that $DIR and $DOTFILEDIR are not the same:
  #   If they are, no need to symlink! [UNTESTED]
  if [[ "$DIR" != "$DOTFILEDIR" ]]; then
    # Put a symbolic link to dotfiles directory at the desired Install Location
    echo -e "*** Symlinking dotfiles directory: ***\n    $DIR\n    -> $DOTFILEDIR"
    # adding -v option to ln can also generate similar output:  target -> source
    symlink "$DIR" "$DOTFILEDIR"
  fi
}

### MAIN
## symlink this directory to home folder
link_dotfiles_dir

## symlink the 'Application Support' folder without a space, so I can offer a valid path in dotsyncrc
## dotsync interprets any space in a destination path - even if escaped - as a delineator for a separate destination for the same dotfile.
symlink "$HOME/Library/Application Support/" "$HOME/.ApplicationSupport" 

## sync dotfiles
~/.dotfiles/dotsync/bin/dotsync -L

## Install vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
