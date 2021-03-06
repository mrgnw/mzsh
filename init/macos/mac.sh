#!/usr/bin/env zsh
is_macos || return 1

ln -s "$ICLOUD" "$HOME/icloud"
ln -s "$ICLOUD/dev" "$HOME/idev"

# Setup iCloud synced directories per user & device
mkdir -p "$device"
mkdir -p "$icfg/espanso"
mkdir -p "$device/espanso"
ln -s "$icfg/espanso" "$(espanso path config)/user/shared"
ln -s "$device/espanso" "$(espanso path config)/user/$(pcname)"

#  - set background to images in directory to $BG_DIR (defined in macos.zsh)
# download: use github.com/farnots/iCloudDownloader
# brew install icloud-downloader / icd
# icd $ICLOUD/images/background
# icd $ICLOUD/images/background/vertical

#  - set $BG_DIR as background dir

echo "📈  CPU usage shows in Activity Monitor Dock icon"
defaults write com.apple.ActivityMonitor IconType -int 5

# Many prefs taken from github.com/mathiasbynens/dotfiles/blob/master/.macos
# turn on tab completion for brew
ln -s "$(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh" /usr/local/share/zsh/site-functions

echo "🌌 Screenshots"
echo "   📂 ~/Pictures/Screenshots "
mkdir ~/Pictures/Screenshots
screenshotDir ~/Pictures/Screenshots
echo "   🏷 Name =  {date & time}.png"
defaults write com.apple.screencapture name 
killall SystemUIServer

# Move apps that I rarely use into the Utilities folder
buryThese=(
	'Automator'
	'Chess'
	'DVD Player'
	'Font Book'
	'Image Capture'
	'Launchpad'
	'Mail'
	'Mission Control'
	'Photo Booth'
	'Stickies'
	'TextEdit'
	'Time Machine'
)
echo "Burying rarely used apps to Utilities"
for x in $buryThese; do
	app=$(basename "$x")
	app="${app%.*}"
	sudo mv /Applications/$app.app /Applications/Utilities/$app.app
done

git config --global core.excludesfile '~/.oh-my-zsh/custom/.gitignore_global'
ln -s ~/.oh-my-zsh/custom/.gitignore_global ~/.config/git/ignore

# Disable smart quotes. Ain't nobody need those
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

echo "🎯 performance"
echo "  🚫 No hibernation = faster sleep"
sudo pmset -a hibernatemode 0

echo "📡  App store"
echo "  🔄 Auto-check for updates, daily"
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
echo "  ⬇️ Auto-download updates"
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

echo " SF Mono"
cp /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/*.otf ~/Library/Fonts/
