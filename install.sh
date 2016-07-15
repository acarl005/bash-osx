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

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
