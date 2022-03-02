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


### APT COMMANDS ###
alias aptup='sudo apt update && sudo apt upgrade'
alias aptupd='sudo apt update'
alias aptupg='sudo apt upgrade'

### BETTER DIRECTORY LIST ###
alias ll='ls -Alh'

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
alias vi='vim'
