mkdir ~/bin
cp -R bin/ ~/
cp .bashrc ~/
cp .bash_aliases ~/
cp .bash_profile ~/
cp .gitconfig ~/
cp .gitignore_global ~/
cp .inputrc ~/
cp .pryrc ~/
cp .psqlrc ~/
cp .mongorc.js ~/
cp .pythonrc.py ~/
cp .vimrc ~/

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install more most up-to-date git and vim
brew install git vim
git clone https://github.com/powerline/fonts ~/Downloads
cd !$
./install.sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

defaults import com.googlecode.iterm2 iterm2.plist

# once atom is installed, run this:
# apm install apathy-theme color-picker emmet file-icons highlight-selected language-ini linter linter-eslint pigments script terminal-plus vim-mode-plus
