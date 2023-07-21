#!/usr/bin/env bash
## http://brew.sh
## Homebrew requires: 
#   A 64-bit Intel CPU or Apple Silicon CPU 1
#   macOS Big Sur (11) (or higher) 2
#   Command Line Tools (CLT) for Xcode (from xcode-select --install or https://developer.apple.com/download/all/) or Xcode 3
#   The Bourne-again shell for installation (i.e. bash) 4

## Reminders:
# `brew search name` to search for formulae and casks containing 'name'
# `brew list` to list installed formulae and casks
# `brew info name` for information on a formula|cask
# 'brew home name` to go to the web page for a formula|cask

## Custom Casks are specified by a path relative to the directory of this file.
## Remember to change the working directory to the one containing this file.

## See also brew.sh in https://mths.be/dotfiles


################################################################
# Install Xcode command-line tools
xcode-select --install

# Install Homebrew
if false; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi;

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade




################################################################
## Command-Line Utilities

# GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# utilities that are usually out of date in default OS X installation
brew install rsync
brew install git
brew install git-gui
brew install wget
brew install curl
brew install grep
#brew install openssh
#brew install ruby


# Unison will only sync with other systems that have the *same version* of unison installed --- including the same build environment (ocaml versions, for example). 
# Install the most recent version of Unison (if all systems support it):
brew install --cask unison    # GUI version (latest) - includes cli: `unison -i -ui text`
# On recent versions of OS X (or macOS), you might get an unhelpful message about the Unison app being damaged:
# https://github.com/bcpierce00/unison/wiki/CI-Binary-instructions
xattr -cr /Applications/Unison.app

if false; then
  # Install latest command-line version only (might be better for remote syncing in some cases)
  brew install unison    # command-line version (latest)
  brew link --overwrite unison    # replace bin with cli-only version
  # If you run into problems syncing with unison, download and install the same specific binary (gui) version from the website and install the command-line tool from the GUI.
  brew unlink unison
  brew home unison
fi


################################################################
## Binaries

#===============================================================
# Essentials #
#brew install --cask cakebrew   # GUI for Homebrew :)
brew install --cask macvim	
#brew install markdown    # included in multimarkdown
brew install multimarkdown

## Browsers
brew install --cask google-chrome
brew install --cask firefox

## Utilities
brew install --cask carbon-copy-cloner
brew install --cask keepassxc
brew install --cask moom    # window management
brew install --cask dropbox
brew install --cask google-drive
brew install --cask omnidisksweeper

brew install --cask github
#brew install --cask GitX
# I have used rowanj's fork, which is officially discontinued: http://rowanj.github.io/gitx/
brew install --cask rowanj-gitx
# don't forget "Open in GitX" ;)
# https://github.com/jawhiteley/openInGitX


#===============================================================
# System Utilities #
#brew install --cask karabiner-elements    	# Remap keys for macOS

#brew install --cask usb-overdrive     # generic driver for USB input devices without native macOS or OS X support

# CandyBar (IconFactory): icon library. Discontinued, but might still run
brew install --cask candybar #--appdir="/Applications/Utilities"	# admin password needed to install to /Applications/Utilities
# free license:
# https://panic.com/bin/setup.php/cb3/PPQA-YAMA-E3KP-VHXG-B6AL-L
# I still have my own v3 license, however.


#===============================================================
# Organization
brew install --cask evernote      # or install from the Mac App Store
#brew install --cask alternote    # OS X streamlined Evernote client with MarkDown support (commercial).
#brew install --cask omnifocus    # I don't have a license for the newest version yet. 
#brew install --cask things       # I prefer OmniFocus, but Things is pretty awesome in its own way.
#brew install --cask moneywell    # Now on Mac App Store
#brew install --cask delicious-library  # http://delicious-monster.com/


#===============================================================
# Productivity
brew install --cask libreoffice
brew install --cask zotero
#brew install --cask virtualbox    # open-source virtualization: requires Intel hardware for now.
#brew install --cask vmware-fusion # virtualization: free for personal use.
#brew install --cask xmind         # mind-mapping

# (La)TeX
# Homebrew still recommends downloading and installing a MacTeX distribution
# https://www.tug.org/mactex/
# But I find it easier to stay up-to-date using Homebrew
brew install --cask mactex    # large download, may require multiple attempts.

# R
brew install --cask r
brew install --cask rstudio

# Graphics
#brew install --cask gimp
brew install --cask inkscape

# Communication
brew install --cask zoom


#===============================================================
# Entertainment
brew install --cask steam	# might be a very old version: open the app to run auto-update.
brew install --cask spotify
brew install --cask vlc
#brew install --cask handbrake     # video transcoding
brew install --cask kobo

# brew install --cask remote-buddy



################################################################
# Cleanup

# Remove outdated versions from the cellar.
brew cleanup

# Remove cached downloads
brew cleanup --prune=all
