# fix bug with atheros network card
# http://askubuntu.com/questions/678145/my-wifi-qualcomm-atheros-device-168c0041-rev-20-doesnt-show-up-and-work-in
# fix gulp watch error
# echo fs.inotify.max_user_watches=582222 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
# ubuntu dark aubergine color: #2C001E rgb(45, 0, 30)

# function for generating escaped color codes
color_esc() {
  echo "\\[\\e[1;${1}m\\]"
}
# foreground
# 30 black
# 31 red
# 32 green
# 33 yellow
# 34 blue
# 35 magenta (purple)
# 36 cyan
# 37 white
# 39 default (white)

# background
# 40 black
# 41 red
# 42 green
# 43 yellow
# 44 blue
# 45 magenta (purple)
# 46 cyan
# 47 white
# 49 default (black)

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


gems="💎💎💎"
christmas="🎁 🎁"
halloween="🎃 👻"
new_years_eve="🎉 🎊"
cinco_de_mayo="🍺🍸🍷"
st_patricks_day="🍀 🍺"
birthday="🎁 🎂 🎈"
valentines="💚💙💜"

prompt="$gems"
[[ $(date +%e) = 14 && $(date +%m) = 2  ]] && prompt="$valentines"
[[ $(date +%e) = 17 && $(date +%m) = 3  ]] && prompt="$st_patricks_day"
[[ $(date +%e) = 5  && $(date +%m) = 5  ]] && prompt="$cinco_de_mayo"
[[ $(date +%e) = 22 && $(date +%m) = 8  ]] && prompt="$birthday"
[[ $(date +%e) = 31 && $(date +%m) = 10 ]] && prompt="$halloween"
[[ $(date +%e) = 25 && $(date +%m) = 12 ]] && prompt="$christmas"
[[ $(date +%e) = 31 && $(date +%m) = 12 ]] && prompt="$new_years_eve"

# PROMPT_COMMAND is a variable whose value is some code that gets evaluated each time the prompt awaits input
# PS1 is the variable for the prompt you see when terminal is awaiting input
PROMPT_COMMAND='
PS1="$(venv)$(format_pwd)$(git_prompt) ${prompt} ${reset_esc} ";
echo -ne "\033]0;$(basename $(pwd))\007";
LAST_COMMAND=$(history 1 | awk '"'"'{print $2}'"'"')
if [[ vim = $LAST_COMMAND || vi = $LAST_COMMAND ]] && [ -d .git ]; then
  git status --short
fi'
export PS2='... '

format_pwd() {
  wd=$(pwd)
  short_wd=${wd/\/Users\/andy/\~}
  first_char=$(echo $short_wd | cut -c 1-1)
  if [[ $first_char != '~' ]]; then
    short_wd="${reset_esc}\e[0;0;40m💀 $(color_esc 35)${short_wd}${reset_esc}"
  fi
  echo -e "$(color_esc 35)${short_wd}"
}

# show a little snake icon if we're in a python virtual environment
venv() {
  if [[ $VIRTUAL_ENV ]]; then
    echo -e "\[\e[0;32m\]🐍 "
  fi
}


# determines if the git branch you are on is clean or dirty and labels accordingly
git_prompt() {
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  # Grab working branch name
  branch=$(__git_ps1)
  # Clean or dirty branch
  if [[ $(git diff) ]]; then
    git_icon="$(color_esc 31)✗"
  elif [[ $(git status --short) ]]; then
    git_icon="📤"
  else
    git_icon="$(color_esc 32)✓"
  fi
  echo "$(color_esc 36)${branch:0:${#branch} - 1}${git_icon}$(color_esc 36))${reset_esc}"
}

# Colors ls should use for folders, files, symlinks etc, see `man ls` and
# search for LSCOLORS
export LSCOLORS=ExGxFxdxCxDxDxaccxaeex

# Force grep to always use the color option and show line numbers
export GREP_OPTIONS='--color=always'


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
