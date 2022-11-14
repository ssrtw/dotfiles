autoload -U +X bashcompinit && bashcompinit
declare -A ZINIT
ZINIT[HOME_DIR]="${HOME}/.config/zinit"
ZINIT[ZCOMPDUMP_PATH]="${HOME}/.cache/zcompdump"
ZINIT[COMPINIT_OPTS]="-C"

source "${HOME}/.config/zinit/zinit.zsh"

for config (${HOME}/.config/zsh/*.zsh) source $config;

export PATH="$PATH:${HOME}/.local/bin/:/usr/local/cross-compiler/bin"

alias rehgfs='sudo vmhgfs-fuse .host:/ /mnt/hgfs/ -o allow_other -o uid=1000'
alias ls="ls --color=auto"
alias ll="ls -al"
