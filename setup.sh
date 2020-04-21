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
# install prezto (zsh package manager)
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
# set a fixed version so no breaking changes will happen
(cd "${ZDOTDIR:-$HOME}/.zprezto" && git reset --hard de7b3b7fdc99f8a67320dc64085dea44914969c7)
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
# Define zsh as default shell (could be bin/zsh)
chsh -s /usr/local/bin/zsh
# install Vundle (Vim plugin manager)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln -sv ./system/.vimrc ~
vim +PluginInstall +qall

echo "> Setup new shell [5/8]"
ln -sv ./system/.env ~
ln -sv ./system/.zshrc ~
ln -sv ./system/.zpreztorc ~
# will source other .dotfiles
source ~/.zshrc

# Install vscode extensions
echo "> Configuring dev environment (Vscode, npm packages) [6/8]"
source install/Codefile
npm install -g $(cat install/npmfile)
ln -sv ./system/.gitconfig ~

echo "> Setup nice font for iterm and vscode [7/8]"
# update iTerm2 config
defaults write -app iTerm 'Custom Color Presets' -dict-add "ayu-dark" "$(cat config/iterm-theme-ayu-dark.itermcolors)"
~/Library/ApplicationSupport/iTerm2/iterm2env/versions/*/bin/python3 config/iterm-set-theme.py
# update vscode config
ln -sv ~/config/vscode-settings.json ~/Library/ApplicationSupport/Code/User/settings.json

echo "> Setup osx settings [8/8]"
source install/macosdefaults.sh
