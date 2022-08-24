#fix obvious typo's
alias cd..='cd ..'
alias pdw="pwd"
alias udpate='sudo pacman -Syyu'
alias upqll="paru -Syu --noconfirm"

#list
alias ll='ls -lAh'
alias ls='ls --color=auto'
alias la='ls -a'
alias l='ls'
alias l.="ls -A | egrep '^\.'"

## GIT ###
alias commit='git commit -m'
alias commita='git commit -am'
alias clone='git clone'
alias pull='git pull origin'
alias push='git push origin'

### VIM ###
alias vi='nvim'
alias vim='nvim'

load_nvm > /dev/stderr
starship init fish | source
fish_vi_key_bindings

