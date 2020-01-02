#!/bin/bash
# http://apple.stackexchange.com/a/123738/72534

osascript -e '
tell application "System Events" to tell process "Finder"
	click menu item "Lock Screen" of menu 1 of menu bar item "Apple" of menu bar 1
end tell
'
