# Dock
## delete all apps in dock
defaults write com.apple.dock persistent-apps -array
## set size of dock icons
defaults write com.apple.dock "tilesize" -int "36"
## undisplay recently used apps
defaults write com.apple.dock "show-recents" -bool "false"
## animate when hiding/showing
defaults write com.apple.dock "mineffect" -string "scale"
## order by most used
defaults write com.apple.dock "mru-spaces" -bool "false"

# Screenshot
## unset shadow
defaults write com.apple.screencapture "disable-shadow" -bool "true"
## location for screenshot preservation
if [[ ! -d "$HOME/Pictures/Screenshots" ]]; then
    mkdir -p "$HOME/Pictures/Screenshots"
fi
defaults write com.apple.screencapture "location" -string "~/Pictures/Screenshots"
## thumbnail display at the time of shooting
defaults write com.apple.screencapture "show-thumbnail" -bool "false"
## preservation form
defaults write com.apple.screencapture "type" -string "jpg"

# Finder
## display to extension
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
## show hidden files
defaults write com.apple.Finder "AppleShowAllFiles" -bool "true"
## show passbar
defaults write com.apple.finder ShowPathbar -bool "true"
## disable warning when opening unidentified files
defaults write com.apple.LaunchServices LSQuarantine -bool "false"
## disable warning when emptying trash
defaults write com.apple.finder WarnOnEmptyTrash -bool "false"

# Feedback
## do not send feedback
defaults write com.apple.appleseed.FeedbackAssistant "Autogather" -bool "false"
## disable Crash Report
defaults write com.apple.CrashReporter DialogType -string "none"

# .DS_Store
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool "true"
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool "true"

# Battery
## battery displayed in %.
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Trackpad
## tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool "true"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool "true"
defaults -currentHost write -g com.apple.mouse.tapBehavior -bool "true"
## trajectory speed
defaults write -g com.apple.trackpad.scaling 3
## scroll direction
defaults write -g com.apple.swipescrolldirection -bool "true"

# Mouse
## trajectory speed
defaults write -g com.apple.mouse.scaling 3
## scroll speed
defaults write -g com.apple.scrollwheel.scaling 5

# Keyboard
## key repeat speed
defaults write NSGlobalDomain KeyRepeat -int 2
## key repeat recognition time
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Security
## firewall
sudo defaults write /Library/Preferences/com.Apple.alf globalstate -int 1

# Others
## use google public dns
networksetup -setdnsservers Wi-Fi 2001:4860:4860::8844 2001:4860:4860::8888 8.8.4.4 8.8.8.8
## unuse auto camelcase
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool "false"
## unvalidate spell check
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool "false"
