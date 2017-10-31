[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.ruby-conf.sh" ]] && source "$HOME/.ruby-conf.sh"
[[ -s "$HOME/.tmux-conf.sh" ]] && source "$HOME/.tmux-conf.sh"

export PATH=/Users/Praveen/.npm-packages/lib/node_modules/:$PATH

export PATH="$HOME/.npm-packages/bin:$PATH"
export PATH="$HOME/user/local/bin:$PATH"
export PATH="$HOME/.node/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/Praveen/Work/google-cloud-sdk/path.bash.inc ]; then
  source '/Users/Praveen/Work/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/Praveen/Work/google-cloud-sdk/completion.bash.inc ]; then
  source '/Users/Praveen/Work/google-cloud-sdk/completion.bash.inc'
fi

# ---------------------------kubectl completion
source <(kubectl completion bash)
#
#if [ -f /usr/local/share/bash-completion/bash_completion ]; then
#. /usr/local/share/bash-completion/bash_completion
#fi
export PATH="/usr/local/opt/node@6/bin:$PATH"

## Git commands
alias log='git log'
alias gco='git checkout'
alias wut='git log master...${branch} --oneline'
alias diff='git diff'
alias branch='git branch'
alias gst='git status'
alias fetch='git fetch'
alias push='git push origin head'
alias pull='git pull'
alias fp='fetch && pull'
alias gmm='git merge master'
alias recent='git for-each-ref --sort=-committerdate refs/heads/'
alias branch_new="git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)'"

## Git branch switching
alias master='git co master'
alias ghp='git co gh-pages'

## MAKE TERMINAL BETTER
alias cp='cp -iv'                           # Preferred 'cp' implementation
alias mv='mv -iv'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
#cd() { builtin cd "$@"; ll; }               # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias edit='subl'                           # edit:         Opens any file in sublime editor
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias which='type -all'                     # which:        Find executables
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive
mcd () { mkdir -p "$1" && cd "$1"; }        # mcd:          Makes new Dir and jumps inside
trash () { command mv "$@" ~/.Trash ; }     # trash:        Moves a file to the MacOS trash
ql () { qlmanage -p "$*" >& /dev/null; }    # ql:           Opens any file in MacOS Quicklook Preview
alias DT='tee ~/Desktop/terminalOut.txt'    # DT:           Pipe content to file on MacOS Desktop


#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
    extract () {
        if [ -f $1 ] ; then
          case $1 in
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

## NETWORKING
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

#   ii:  display useful host related informaton
#   -------------------------------------------------------------------
    ii() {
        echo -e "\nYou are logged on ${RED}$HOST"
        echo -e "\nAdditionnal information:$NC " ; uname -a
        echo -e "\n${RED}Users logged on:$NC " ; w -h
        echo -e "\n${RED}Current date :$NC " ; date
        echo -e "\n${RED}Machine stats :$NC " ; uptime
        echo -e "\n${RED}Current network location :$NC " ; scselect
        echo -e "\n${RED}Public facing IP Address :$NC " ;myip
        #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns
        echo
    }

# custom praveen alias
alias platform='cd ~/Work/hasura/platform'
alias console='cd ~/Work/hasura/platform/components/console'

# Kubernetes commands
alias k="kubectl"

# Common actions
alias describe="k describe"
alias get="k get"
alias create="k create"
alias apply="k apply"
alias delete="k delete"
alias scale="k scale"
alias rollout="k rollout"
alias logs="k logs"

# Query common resources
# Resource reference list:
# pods (po), services (svc), deployments, replicasets (rs)
# replicationcontrollers (rc), nodes (no), events (ev),
# limitranges (limits), persistentvolumes (pv),
# persistentvolumeclaims (pvc), resourcequotas (quota),
# namespaces (ns), serviceaccounts (sa), ingresses (ing),
# horizontalpodautoscalers (hpa), daemonsets (ds), configmaps,
# componentstatuses (cs), endpoints (ep), and secrets.
alias pods="get pods"
alias services="get svc"
alias svc="get svc"
alias deployments="get deployments"
alias dep="get deployments" # NON-STANDARD!!
alias replicasets="get rs"
alias replicationcontrollers="get rc"
alias rc="get rc"
alias nodes="get nodes"
alias limitranges="get limitranges"
alias limits="get limitranges"
alias events="get events"
alias persistentvolumes="get pv"
alias pv="get pv"
alias persistentvolumeclaims="get pvc"
alias pvc="get pvc"
alias namespaces="get ns"
alias ingresses="get ing"
alias ing="get ing"
alias configmaps="get configmaps"
alias secrets="get secrets"

export KUBECTL_CONTEXT=$(kubectl config current-context)
export KUBECTL_NAMESPACE=${DEFAULT_NAMESPACE-default}

# ----------------------------git branch in shell
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="🙄\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[33m\] $KUBECTL_CONTEXT\[\033[00m\] $ "
#export PS1="😼\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[33m\] 🌝 $KUBECTL_CONTEXT\[\033[00m\] $ "

# git branch in shell over

# powerline font compatibility
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
#set -o vi

# for history complete
export HH_CONFIG=hicolor         # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi

