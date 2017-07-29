# some more aliases

# shell stuff
alias grep='grep --exclude-dir=node_modules'
alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ls='ls -Gp'
alias less='less -FSRXc'
alias rn='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'

# write the zsh commands for going up directories by typing a number of dots
DOTS=..
ARG=..
for i in `seq 1 11`; do
  alias $DOTS="cd $ARG"
  DOTS="${DOTS}."
  ARG="${ARG}/.."
done

alias e=$EDITOR
alias vi=vim

# jump to commonly used directories
alias desk="pushd $HOME/Desktop"
export desk="$HOME/Desktop"
alias proj="pushd $HOME/Documents/projects"
export proj="$HOME/Documents/projects"
alias prod="pushd $HOME/Documents/production"
export prod="$HOME/Documents/production"
alias stem="pushd $HOME/Documents/stem"
export stem="$HOME/Documents/stem"
alias down="pushd $HOME/Downloads"
export down="$HOME/Downloads"
alias docs="pushd $HOME/Documents"
export docs="$HOME/Documents"
alias pg="/usr/local/var/postgres"
export pg="/usr/local/var/postgres"

# shorten misc things
alias al='e ~/.bash_aliases && . ~/.bash_aliases'
alias rc='e ~/.bashrc'
alias serv="python -m SimpleHTTPServer"
alias chrome="open -a /Applications/Google\ Chrome.app/"
alias u='echo -n `uuid` | pbcopy'
alias pirate='youtube-dl --extract-audio --audio-format mp3'
alias probe='ffprobe -of json -show_streams -show_format'

alias dm="docker-machine"
alias fm=foreman
alias ipy=ipython
alias ns="npm start"
alias root='cd `git rev-parse --show-toplevel`'

alias etcbkp='rm -rf ~/etcd-backup && etcdctl backup --data-dir ~/default.etcd --backup-dir ~/etcd-backup && tar -C ~ -cvzf etcd-backup.tar.gz etcd-backup; ls ~/etcd-backup.tar.gz'
alias etc='etcdctl'
alias sandbox-etc='etcdctl --ca-file ~/etcd-sandbox.cert --no-sync --peers "https://aws-us-east-1-portal.12.dblayer.com:10799,https://aws-us-east-1-portal.15.dblayer.com:11263" -u root:JZGSKAQDFQLPDBUZ'

#typos
alias tit=git
alias gti=git
alias npmi='npm i'
alias gits='git s'

