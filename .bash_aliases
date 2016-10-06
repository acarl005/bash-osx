# some more aliases

alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ls='ls -Gp'
alias ccat='/bin/cat'
alias less='less -FSRXc'
alias rn='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
DOTS=..
ARG=..
for i in `seq 1 11`; do
  alias $DOTS="cd $ARG"
  DOTS="${DOTS}."
  ARG="${ARG}/.."
done

alias al='e ~/.bash_aliases'
alias rc='e ~/.bashrc'
alias be="bundle exec"
alias serv="python -m SimpleHTTPServer"
alias chrome="open -a /Applications/Google\ Chrome.app/"
alias e=$EDITOR
# use installed version of vim instead of system default
[[ -e /usr/local/bin/vim ]] && {
  alias vim="/usr/local/bin/vim"
  alias vi="/usr/local/bin/vim"
}

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

alias gs="git s"
alias dm="docker-machine"
alias fm=foreman

alias nis="npm install --save"
alias nisd="npm install --save-dev"
alias ns="npm start"
alias nsd="npm run start-dev"
alias nr="npm run"
alias root='builtin cd `npm root` && cd ..'
alias groot="cd `git rev-parse --show-toplevel`"

alias u='echo -n `uuid` | pbcopy'

alias jets=jest

alias etcbkp='rm -rf ~/etcd-backup && etcdctl backup --data-dir ~/default.etcd --backup-dir ~/etcd-backup && tar -C ~ -cvzf etcd-backup.tar.gz etcd-backup; ls ~/etcd-backup.tar.gz'
alias etc='etcdctl'
alias sandbox-etc='etcdctl --ca-file ~/etcd-sandbox.cert --no-sync --peers "https://aws-us-east-1-portal.12.dblayer.com:10799,https://aws-us-east-1-portal.15.dblayer.com:11263" -u root:JZGSKAQDFQLPDBUZ'
