if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec startx -- -keeptty
    end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

#fix obvious typo's
alias cd..='cd ..'
alias pdw="pwd"
alias udpate='sudo pacman -Syyu'
alias upqll="paru -Syu --noconfirm"

#list
alias ll='exa -al'
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

### PACKAGE MANAGERS ###
# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

starship init fish | source
set -g fish_greeting

