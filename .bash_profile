use_rvm() {
  export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
}

if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi


function _update_ps1() { export PS1="$(/Users/andy/Downloads/promptastic/promptastic.py $?)"; }
export PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
