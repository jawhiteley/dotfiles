#!/usr/bin/env bash

# cd to this directory
# bash install.sh

### PARAMETERS
### A lot of this is based on https://github.com/dotphiles/dotsync/
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
  # if [[ ! -d $DOTFILEDIR ]]; then
    # Check that $DIR and $DOTFILEDIR are not the same:
    #   If they are, no need to symlink! [UNTESTED]
    #if [[ "$DIR" != "$DOTFILEDIR" ]]
    # Put a symbolic link to dotfiles directory at the desired Install Location
    echo -e "*** Symlinking dotfiles directory: ***\n    $DIR\n    -> $DOTFILEDIR"
    # adding -v option to ln can also generate similar output:  target -> source
    symlink "$DIR" "$DOTFILEDIR"
    #fi
  # fi
}

symlink ()
{
  if [[ -e "$2" ]] && [[ ! -h "$2" ]]; then
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


### MAIN
checkdirs
