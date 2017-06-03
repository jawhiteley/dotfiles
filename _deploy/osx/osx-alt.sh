#!/usr/bin/env bash
## Set alternate system preferences via terminal commands
## 	SSD, smaller screen size
## Run after main `osx.sh` script to override prefs from there.

###############################################################################
# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


###############################################################################
# SSD-specific tweaks                                                         #
###############################################################################

# Disable hibernation (speeds up entering sleep mode)
sudo pmset -a hibernatemode 0

# Remove the sleep image file to save disk space
sudo rm /private/var/vm/sleepimage
# Create a zero-byte file instead…
sudo touch /private/var/vm/sleepimage
# …and make sure it can’t be rewritten
sudo chflags uchg /private/var/vm/sleepimage

###############################################################################
# Finder                                                                      #
###############################################################################

# Set grid spacing for icons on the desktop and in other icon views [100]
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 80" ~/Library/Preferences/com.apple.finder.plist

# Set the size of icons on the desktop and in other icon views [80]
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 64" ~/Library/Preferences/com.apple.finder.plist

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

# Set the icon size of Dock items (pixels)
defaults write com.apple.dock tilesize -int 52

# Dock magnification
defaults write com.apple.dock magnification -bool false

# Set the icon size of magnified Dock items (pixels)
defaults write com.apple.dock tilesize -int 64	#

# auto-hiding Dock delay [0 to remove]
defaults write com.apple.dock autohide-delay -float 0.1	#
# animation when hiding/showing the Dock (0 to remove)
defaults write com.apple.dock autohide-time-modifier -float 0.1	#

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "cfprefsd" \
	"Dock" \
	"Finder" \
	"SystemUIServer"; do
	killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."

