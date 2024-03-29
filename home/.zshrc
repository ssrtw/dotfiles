# custom zsh config location
ZSH_CUSTOM="$HOME/.config/zsh"

# https://askubuntu.com/a/847305
# paste without highlight
zle_highlight+=(paste:none)

# load all zsh config
for config (${HOME}/.config/zsh/*.zsh) source $config;

export PATH="$PATH:${HOME}/.local/bin/:/usr/local/cross-compiler/bin"
export PATH="$PATH:/usr/local/go/bin"

alias rehgfs='sudo vmhgfs-fuse .host:/ /mnt/hgfs/ -o allow_other -o uid=1000'
alias ls="ls --color=auto"
alias ll="ls -al"
alias cat="bat"
alias gdb="gdb -q"
alias vim="nvim"
alias python="python3"

eval "$(starship init zsh)"
