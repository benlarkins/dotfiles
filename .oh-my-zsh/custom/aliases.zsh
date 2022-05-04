#
#   ZZZZZZZZZZZZZZZZZZZ   SSSSSSSSSSSSSSS HHHHHHHHH     HHHHHHHHH
#   Z:::::::::::::::::Z SS:::::::::::::::SH:::::::H     H:::::::H
#   Z:::::::::::::::::ZS:::::SSSSSS::::::SH:::::::H     H:::::::H
#   Z:::ZZZZZZZZ:::::Z S:::::S     SSSSSSSHH::::::H     H::::::HH
#   ZZZZZ     Z:::::Z  S:::::S              H:::::H     H:::::H
#           Z:::::Z    S:::::S              H:::::H     H:::::H
#          Z:::::Z      S::::SSSS           H::::::HHHHH::::::H
#         Z:::::Z        SS::::::SSSSS      H:::::::::::::::::H
#        Z:::::Z           SSS::::::::SS    H:::::::::::::::::H
#       Z:::::Z               SSSSSS::::S   H::::::HHHHH::::::H
#      Z:::::Z                     S:::::S  H:::::H     H:::::H
#   ZZZ:::::Z     ZZZZZ            S:::::S  H:::::H     H:::::H
#   Z::::::ZZZZZZZZ:::ZSSSSSSS     S:::::SHH::::::H     H::::::HH
#   Z:::::::::::::::::ZS::::::SSSSSS:::::SH:::::::H     H:::::::H
#   Z:::::::::::::::::ZS:::::::::::::::SS H:::::::H     H:::::::H
#   ZZZZZZZZZZZZZZZZZZZ SSSSSSSSSSSSSSS   HHHHHHHHH     HHHHHHHHH


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

### NAVIGATE UP DIRS ###
up () {
  local d=""
  local limit="$1"

  # Default to limit of 1
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done

  # perform cd. Show error if cd fails
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs.";
  fi
}

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
