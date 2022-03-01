#    BBBBBBBBBBBBBBBBB   LLLLLLLLLLL   
#    B::::::::::::::::B  L:::::::::L             
#    B::::::BBBBBB:::::B L:::::::::L             
#    BB:::::B     B:::::BLL:::::::LL             
#      B::::B     B:::::B  L:::::L               
#      B::::B     B:::::B  L:::::L               
#      B::::BBBBBB:::::B   L:::::L               
#      B:::::::::::::BB    L:::::L               
#      B::::BBBBBB:::::B   L:::::L               
#      B::::B     B:::::B  L:::::L               
#      B::::B     B:::::B  L:::::L               
#      B::::B     B:::::B  L:::::L         LLLLLL
#    BB:::::BBBBBB::::::BLL:::::::LLLLLLLLL:::::L
#    B:::::::::::::::::B L::::::::::::::::::::::L
#    B::::::::::::::::B  L::::::::::::::::::::::L
#    BBBBBBBBBBBBBBBBB   LLLLLLLLLLLLLLLLLLLLLLLL

### APT COMMANDS ###
alias aptup='sudo apt update && sudo apt upgrade'
alias aptupd='sudo apt update'
alias aptupg='sudo apt upgrade'

### BETTER DIRECTORY LIST ###
alias ll='ls -Alf'

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
