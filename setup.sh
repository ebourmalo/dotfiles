# install the command line tools
# sudo softwareupdate -i -a
echo "> Install command line tools [1/8]"
xcode-select --install

# install brew
echo "> Install osx package manager [2/8]"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install mas

# install brew
echo "> Install binaries and apps [3/8]"
brew bundle --file ./install/Brewfile

echo "> Install shell environment [4/8]"
zsh
ln -sv ~/Library/Application\ Support ~/Library/ApplicationSupport
# install prezto (zsh package manager)
git clone --recursive https://github.com/sorin-ionescu/prezto.git "$HOME/.zprezto"
# set a fixed version so no breaking changes will happen
(cd "$HOME/.zprezto" && git reset --hard de7b3b7fdc99f8a67320dc64085dea44914969c7)
setopt EXTENDED_GLOB
for rcfile in "$HOME"/.zprezto/runcoms/^README.md(.N); do
  ln -sv "$rcfile" "$HOME/.${rcfile:t}"
done
# Define zsh as default shell (could be bin/zsh)
chsh -s /usr/local/bin/zsh
# install Vundle (Vim plugin manager)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -sv $(pwd)/config/.vimrc ~
vim +PluginInstall +qall

echo "> Setup new shell [5/8]"
mkdir -p $HOME/.zsh_functions
cp $(pwd)/config/_alacritty $HOME/.zsh_functions/_alacritty
ln -sv $(pwd)/config/.alacritty.yml ~
ln -sv $(pwd)/config/.tmux.conf ~
ln -sv $(pwd)/system/.env ~
ln -sv $(pwd)/system/.alias ~
# remove the 2 files before symlink
rm ~/.zshrc ~/.zpreztorc
ln -sv $(pwd)/system/.zshrc ~
ln -sv $(pwd)/system/.zpreztorc ~
# will source other .dotfiles
source ~/.zshrc

# Install vscode extensions
echo "> Configuring dev environment (Vscode, npm packages) [6/8]"
source install/Codefile
npm install -g $(cat install/npmfile)
ln -sv $(pwd)/system/.gitconfig ~

echo "> Configuring themes and fonts [7/8]"
# update iTerm2 config
defaults write com.googlecode.iterm2 'Custom Color Presets' -dict-add "ayu-dark" "$(cat config/iterm-theme-ayu-dark.itermcolors)"
defaults write com.googlecode.iterm2 EnableAPIServer -bool true
pip3 install iterm2
python3 scripts/iterm-set-theme.py
# update vscode config
ln -sv $(pwd)/config/vscode-settings.json ~/Library/ApplicationSupport/Code/User/settings.json
ln -sv $(pwd)/config/vscode-keybindings.json ~/Library/ApplicationSupport/Code/User/keybindings.json

echo "> Setup osx settings [8/8]"
source ./install/macosdefaults.sh

echo "> Restarting mac now!"
sudo shutdown -r now