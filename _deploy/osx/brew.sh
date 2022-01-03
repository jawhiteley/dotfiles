#!/usr/bin/env bash
## http://brew.sh
## Homebrew requires: an intel CPU, OS X >=10.9, Xcode or command-line tools for Xcode, and a bourne-compatible shell.

## Custom Casks are specified by a path relative to the directory of this file.
## Remember to change the working directory to the one containing this file.

## See also brew.sh in https://mths.be/dotfiles


################################################################
# Install Xcode command-line tools (optional)
xcode-select --install

# Install Homebrew
if false; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

# As of December 2015, Homebrew-Cask will now be kept up-to-date with Homebrew itself:
# https://github.com/caskroom/homebrew-cask


# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# * install stuff without Xcode CLT?
#brew sh


################################################################
## Command-line Utilities

# GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# utilities that are usually out of date in default OS X installation
brew install curl
brew install git
brew install ruby
brew install rsync
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh

# Install `wget` with IRI support.
brew install wget --with-iri


# Unison will only sync with other systems that have the *same version* of unison installed --- including the same build environment (ocaml versions, for example). 
if true; then
  # Install the most recent version of Unison: if all systems support it.
  brew install --cask unison    # GUI version (latest) - includes cli: `unison -i -ui text`
  # On recent versions of OS X (or macOS), you might get an unhelpful message about the Unison app being damaged:
  # https://github.com/bcpierce00/unison/wiki/CI-Binary-instructions
  xattr -cr /Applications/Unison.app
  brew install unison    # command-line version (latest)
  brew link --overwrite unison    # replace bin with cli-only version
elif false; then
  # Install specific version (2.40), to ensure compatibility.
  brew tap caskroom/versions
  brew cask install unison240
  # Use the menu in the GUI to 'install command-line tool'
  # Or use the following commands:
  # brew tap homebrew/versions # deprecated
  brew install unison@2.40 # new format
else
  # If you run into problems syncing with unison, download and install the same specific binary (gui) version from the website and install the command-line tool from the GUI.
  brew unlink unison
  brew home unison
fi


################################################################
## Binaries

#===============================================================
# Essentials #
brew cask install cakebrew   # GUI for Homebrew :)
#brew install macvim	# requires a full instllation of Xcode; never could get this to work reliably
brew cask install macvim
#brew install markdown    # included in multimarkdown
brew install multimarkdown

## Browsers
#brew cask install google-chrome
brew cask install firefox

## Utilities
brew cask install dropbox
brew cask install carbon-copy-cloner
brew cask install moom    # window management
brew cask install keepassxc
#brew cask install macpass
brew cask install github
#brew cask install GitX     # I like brotherbard's fork: https://github.com/brotherbard/gitx
# don't forget "Open in GitX" ;)


#===============================================================
# System Utilities #
brew cask install karabiner-elements    	# Remap keys for OS X 10.9--10.11 (now karabiner-elements)
#brew cask install seil         	# Remap Capslock and other things Karabiner can not do.
#brew cask install usb-overdrive     # generic driver for USB input devices without native OS X support

# CandyBar (IconFactory): icon library. discontinued, but might still work
#brew cask install candybar #--appdir="/Applications/Utilities"	# admin password needed to install to /Applications/Utilities
# free license:
# https://panic.com/bin/setup.php/cb3/PPQA-YAMA-E3KP-VHXG-B6AL-L


#===============================================================
# Organization
brew cask install evernote      # or install from the Mac App Store
#brew cask install alternote    # OS X streamlined Evernote client with MarkDown support (commercial).
#brew cask install omnifocus    # I don't have a license for the newest version yet. 
# https://www.omnigroup.com/download
# custom formula for the version I want, relative to current directory:
#brew cask install ./Casks/my-omnifocus.rb
#brew cask install things       # I prefer OmniFocus, but Things is pretty awesome in its own way.
brew cask install moneywell
brew cask install delicious-library


#===============================================================
# Productivity
#brew cask install microsoft-office-365
brew cask install libreoffice
brew cask install zotero
brew cask install virtualbox    # Open-Source virtualization

# (La)TeX
# Homebrew still recommends downloading and installing a MacTeX distribution
# https://www.tug.org/mactex/
brew cask install mactex    # large download

# R
# https://stat.ethz.ch/pipermail/r-sig-mac/2013-September/010272.html
# http://stackoverflow.com/questions/20457290/installing-r-with-homebrew
## pkg installers require admin password to be entered manually ##
if false; then
  # Install & build from source
  brew tap homebrew/science
  #brew install gcc    # should be installed automatically as a dependency to r in homebrew.
  brew install Caskroom/cask/xquartz
  brew install r
else
  ## Install pre-compiled binaries.
  if false; then
    ## R v2.12.2 - used for SECC PhD analyses. 
    ##    The installer may refuse to run on os X > 10.9 (because it thinks '10.10' is < '10.5.0')
    ##    The installer can be manually modified to run on any version of macOS (>=10.1): 
    ##    https://stackoverflow.com/a/44147830/1112770
    ## custom cask: path relative to this file.
    brew cask install ./Casks/my-r-212.rb
    ## Installing the latest R automatically updates the first 'R.app' in /Applications (sorted alphabetically), and deletes 'R64.app'
    ## Remember that any R.app (R GUI) will ONLY work correctly with the version of R it was compiled against; but it automatically loads the 'current' version of R.
    ## - use RSwitch to switch the current version of R, and use the matching R.app
    ## Rename R.app from legacy version to allow installer to install new version.	
    cp -R /Applications/R.app /Applications/R32-2.12.app      # has to sort after 'R.app'; R32-v# or Rv# (NOT R-v#)
    cp -R /Applications/R64.app /Applications/R64-2.12.app
  fi
  ## current version
  brew cask install r-app
  # Rswitch - quickly switch between installed versions of R framework
  brew cask install ./Casks/rswitch.rb
fi



# Graphics
#brew cask install gimp
#brew cask install inkscape


#===============================================================
# Entertainment
brew cask install vlc
brew cask install steam	# might be a very old version: open the app to run auto-update.


#===============================================================
# Cleanup

# Remove outdated versions from the cellar.
brew cleanup

# Remove cached downloads
brew cask cleanup
