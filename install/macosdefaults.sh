# Finder: show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "$HOME/Desktop"
# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"
# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "
# Disable smart dashes as they’re annoying when typing code.
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# Disable automatic periods with a double space:
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
# Disable smart quotes as they’re annoying when typing code.
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Set a shorter delay until key repeat:
defaults write NSGlobalDomain InitialKeyRepeat -int 15
# Set a blazingly fast keyboard repeat rate:
defaults write NSGlobalDomain KeyRepeat -int 2

# define opera as default browser
(cd scripts && ./defaultbrowser opera)
# fallback if defaultbrowser binary fails
# (cd scripts && gcc -o defaultbrowser -O2 -framework Foundation \
# -framework ApplicationServices defaultbrowser.m && ./defaultbrowser opera)

######################## Disable all autocorrect features ####################
#
#    Correct spelling automatically
#    disable for system, enable for web input fields (check also with Safari configuration script!)
defaults write -globalDomain "NSAutomaticSpellingCorrectionEnabled" -bool false
defaults write -globalDomain "WebAutomaticSpellingCorrectionEnabled" -bool true
#
#    Capitalise words automatically
#    disable
defaults write -globalDomain "NSAutomaticCapitalizationEnabled" -bool false
#
#    Add full stop with double-space
#    disable
defaults write -globalDomain "NSAutomaticPeriodSubstitutionEnabled" -bool false
#
#    Spelling
#    enable 'Automatic by Language'
defaults write -globalDomain "NSSpellCheckerAutomaticallyIdentifiesLanguages" -bool false
#    for a single language, set 'NSPreferredSpellServerLanguage' and 'NSPreferredSpellServerVendors'
#  Undocumented:  Offer Text Replacement/Completion
#  enable
defaults write -globalDomain "NSAutomaticTextCompletionEnabled" -bool true

# For VS Code
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
# For VS Code Insider 
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
defaults delete -g ApplePressAndHoldEnabled