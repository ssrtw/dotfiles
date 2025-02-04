# paste without highlight (https://askubuntu.com/a/847305)
zle_highlight+=(paste:none)

export PATH="$PATH:${HOME}/.local/bin"

alias ls="lsd"
alias ll="ls -al"
alias gdb="gdb -q"
alias python="python3"

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
