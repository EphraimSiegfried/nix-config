
run() {
  nix-shell --quiet -p "$1" --run \""$*"\"
}

fkill() {
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "$pid" != "" ]
  then
    kill -"${1:-9}" "$pid"
  fi
}

t() {
  sesh connect "$(sesh list | fzf --height 40% --reverse --border-label ' tmux ' --border --prompt '⚡  ')"
}
