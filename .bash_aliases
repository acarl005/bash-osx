# some more aliases

alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
alias ll='/bin/ls -FGlAhp'
alias ls='ls -Gp'
alias less='less -FSRXc'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias al='e ~/.bash_aliases'
alias rc='e ~/.bashrc'
alias be="bundle exec"
alias serv="python -m SimpleHTTPServer"
alias chrome="open -a /Applications/Google\ Chrome.app/"
alias e=atom

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

alias nis="npm install --save"
alias nisd="npm install --save-dev"
alias ns="npm start"
alias nsd="npm run start-dev"
alias nr="npm run"

alias mon="~/Documents/projects/mongoose-model-cli/bin/mongoose-model-cli"

alias u='echo -n `uuid` | pbcopy'

alias etcbkp='rm -rf ~/etcd-backup && etcdctl backup --data-dir ~/default.etcd --backup-dir ~/etcd-backup && tar -C ~ -cvzf etcd-backup.tar.gz etcd-backup; ls ~/etcd-backup.tar.gz'
alias etc='etcdctl'
alias sandbox-etc='etcdctl --ca-file ~/etcd-sandbox.cert --no-sync --peers "https://aws-us-east-1-portal.12.dblayer.com:10799,https://aws-us-east-1-portal.15.dblayer.com:11263" -u root:JZGSKAQDFQLPDBUZ'
