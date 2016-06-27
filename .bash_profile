use_rvm() {
  export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
}

if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi
