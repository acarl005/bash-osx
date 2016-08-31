# fix bug with atheros network card
# http://askubuntu.com/questions/678145/my-wifi-qualcomm-atheros-device-168c0041-rev-20-doesnt-show-up-and-work-in
# fix gulp watch error
# echo fs.inotify.max_user_watches=582222 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
# ubuntu dark aubergine color: #2C001E rgb(45, 0, 30)

# function for generating escaped color codes
fg_bg_esc() {
  echo "\\[\\e[0;38;5;${1};48;5;${2};1m\\]"
}
fg_esc() {
  echo "\\[\\e[0;38;5;${1};49;22m\\]"
}

# set back to normal
reset_esc='\[\e[0m\]'

# generate the right ANSI escape sequences for the 256 color codes (foreground and background)
forg() {
  echo "\\033[38;5;${1}m"
}
backg() {
  echo "\\033[48;5;${1}m"
}
# set color back to normal
reset='\033[0m'

# print a message if a dependency is missing
suggest() {
  echo -e "$(backg 52)You can \033[4menhance\033[24m the experience by installing $(forg 51)$1$reset$(backg 52). Install here $(forg 199)$2$reset."
}

export NVM_DIR="/Users/andy/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && {
  . "$NVM_DIR/nvm.sh"  # This loads nvm
  export NODE_PATH="$HOME/.nvm/versions/node/$(node -v)/lib/node_modules"
}

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
  PATH="$HOME/bin:$PATH"
fi

# include Golang stuff
if [ -d "$HOME/Go" ]; then
  export GOPATH="$HOME/Go"
  PATH="$GOPATH/bin:$PATH"
fi

# use the version of Git i installed with homebrew instead of the one that came with the OS
if brew --prefix git >/dev/null 2>&1; then
  PATH="$(brew --prefix git)/bin:$PATH"
fi

# set java home
if [[ `which java` ]]; then
  export JAVA_HOME=`/usr/libexec/java_home`
fi

if [[ `which neofetch` ]]; then
  neofetch
else
  # Greet me with a mario and other stuff
  echo
  echo -e "[48;5;m          [0m[48;5;9m          [0m[48;5;m    [0m[48;5;224m      [0m[48;5;m  [0m\
    $(forg 227)username: $(forg 33)$USER"
  echo -e "[48;5;m        [0m[48;5;9m                  [0m[48;5;224m    [0m[48;5;m  [0m\
    $(forg 227)date: $(forg 33)$(date)"
  echo -e "[48;5;m        [0m[48;5;95m      [0m[48;5;224m    [0m[48;5;0m  [0m[48;5;224m  [0m[48;5;m  [0m[48;5;9m      [0m[48;5;m  [0m\
    $(forg 227)hostname: $(forg 33)$HOSTNAME"
  echo -e "[48;5;m      [0m[48;5;95m  [0m[48;5;224m  [0m[48;5;95m  [0m[48;5;224m      [0m[48;5;0m  [0m[48;5;224m      [0m[48;5;9m    [0m[48;5;m  [0m\
    $(forg 227)kernel: $(forg 33)$OSTYPE"
  echo -e "[48;5;m      [0m[48;5;95m  [0m[48;5;224m  [0m[48;5;95m    [0m[48;5;224m      [0m[48;5;95m  [0m[48;5;224m      [0m[48;5;9m  [0m[48;5;m  [0m"
  echo -e "[48;5;m      [0m[48;5;95m    [0m[48;5;224m        [0m[48;5;95m        [0m[48;5;9m  [0m[48;5;m    [0m"
  echo -e "[48;5;m          [0m[48;5;224m              [0m[48;5;9m    [0m[48;5;m    [0m"
  echo -e "[48;5;m    [0m[48;5;9m        [0m[48;5;33m  [0m[48;5;9m      [0m[48;5;33m  [0m[48;5;9m    [0m[48;5;m    [0m[48;5;95m  [0m"
  echo -e "[48;5;224m    [0m[48;5;9m          [0m[48;5;33m  [0m[48;5;9m      [0m[48;5;33m  [0m[48;5;m    [0m[48;5;95m    [0m"
  echo -e "[48;5;224m      [0m[48;5;9m        [0m[48;5;33m        [0m[48;5;11m  [0m[48;5;33m    [0m[48;5;95m    [0m"
  echo -e "[48;5;m  [0m[48;5;224m  [0m[48;5;m    [0m[48;5;33m  [0m[48;5;9m  [0m[48;5;33m    [0m[48;5;11m  [0m[48;5;33m          [0m[48;5;95m    [0m"
  echo -e "[48;5;m    [0m[48;5;95m      [0m[48;5;33m                  [0m[48;5;95m    [0m"
  echo -e "[48;5;m  [0m[48;5;95m      [0m[48;5;33m            [0m[48;5;m            [0m"
  echo -e "[48;5;m  [0m[48;5;95m    [0m[48;5;m                          [0m"
  echo
  suggest neofetch https://github.com/dylanaraps/neofetch
fi

# Load git completions
git_completion_script=/usr/local/etc/bash_completion.d/git-completion.bash
git_prompt_script=/usr/local/etc/bash_completion.d/git-prompt.sh
test -s $git_completion_script && source $git_completion_script
test -s $git_prompt_script && source $git_prompt_script

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# PROMPT_COMMAND is a variable whose value is some code that gets evaluated each time the prompt awaits input
# PS1 is the variable for the prompt you see when terminal is awaiting input
PROMPT_COMMAND='PS1="$(generate_prompt)${reset_esc} "
echo -ne "\033]0;$(basename $(pwd))\007";'
export PS2='... '

generate_prompt() {
  PYTHON_BG=27
  PYTHON_STR=
  if [[ $VIRTUAL_ENV ]]; then
    PYTHON_STR="🐍 "
  fi

  DIR_BG=54
  DIR_STR='\w'
  DIR_FG=255
  if [[ $(pwd) != "$HOME"* ]]; then
    DIR_BG=0
    DIR_FG=210
    DIR_STR="💀 \w"
  fi

  GIT_BG=
  GIT_STR=
  if git rev-parse --git-dir > /dev/null 2>&1; then
    GIT_STR=$(__git_ps1 | sed 's/ (\(.*\))$/\1/')
    if [[ $(git diff) ]]; then
      GIT_BG=88
    elif [[ $(git status --short) ]]; then
      GIT_BG=130
    else
      GIT_BG=22
    fi
  fi

  PROMPT_STR=
  if [[ ! -z $PYTHON_STR ]]; then
    PROMPT_STR="$(fg_bg_esc 255 $PYTHON_BG)$PYTHON_STR  $(fg_bg_esc $PYTHON_BG $DIR_BG)"
  fi
  PROMPT_STR="$PROMPT_STR$(fg_bg_esc $DIR_FG $DIR_BG) $DIR_STR "
  if [[ -z $GIT_STR ]]; then
    PROMPT_STR="$PROMPT_STR$(fg_esc $DIR_BG)"
  else
    PROMPT_STR="$PROMPT_STR$(fg_bg_esc $DIR_BG $GIT_BG)$(fg_bg_esc 255 $GIT_BG) $GIT_STR $(fg_esc $GIT_BG)"
  fi
  echo $PROMPT_STR
}



# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=ExGxFxdxCxDxDxaccxaeex

# Force grep to always use the color option and show line numbers
export GREP_OPTIONS='--color=auto'


# Set atom as the default editor
# [[ $(which atom) ]] && export EDITOR=atom
export EDITOR=vim

if [[ `which ls-color` ]]; then
  alias ll='ls-color -laiI'
else
  suggest color-ls https://github.com/acarl005/color-ls
  alias ll='/bin/ls -FGlAhp'
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# custom completions
if [ -f ~/.bash_completions ]; then
  . ~/.bash_completions
fi

cd() { builtin cd "$@"; ll; }
pushd() { builtin pushd "$@"; ll; }
mkcd() { mkdir -p "$1" && cd "$1"; }
te() { touch "$1"; e "$1"; }

if [[ `which pygmentize` ]]; then
  # overwrite cat command so that it uses pygments instead
  cat() {
    pygmentize "$@" 2>/dev/null # silence errors
    [[ $? != 0 ]] && /bin/cat "$@" # if an error occurs, fall back to the regular cat
  }
else
  suggest pygments http://pygments.org/download/
fi

docker-alias() {
  ALIAS=`cat $HOME/.docker-aliases | grep -e "^$1"`
  echo "Running the following command for alias \"$(echo $ALIAS | cut -d= -f1)\":"
  COMMAND=`echo $ALIAS | cut -d= -f2`
  echo $COMMAND
  eval $COMMAND
}


#full recursive directory listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#extract most known archives
extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.xz)    tar xvfJ $1    ;;
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}


#   ----------------
#   NETWORKING
#   ----------------

alias myip='curl ip.appspot.com'                    # myip:         Public facing IP Address
alias netCons='lsof -i'                             # netCons:      Show all open TCP/IP sockets
alias flushDNS='dscacheutil -flushcache'            # flushDNS:     Flush out the DNS Cache
alias lsock='sudo /usr/sbin/lsof -i -P'             # lsock:        Display open sockets
alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP'   # lsockU:       Display only open UDP sockets
alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP'   # lsockT:       Display only open TCP sockets
alias ipInfo0='ipconfig getpacket en0'              # ipInfo0:      Get info on connections for en0
alias ipInfo1='ipconfig getpacket en1'              # ipInfo1:      Get info on connections for en1
alias openPorts='sudo lsof -i | grep LISTEN'        # openPorts:    All listening connections
alias showBlocked='sudo ipfw list'                  # showBlocked:  All ipfw rules inc/ blocked IPs

# load a config file for the python REPL
export PYTHONSTARTUP=$HOME/.pythonrc.py

