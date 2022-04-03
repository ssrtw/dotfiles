autoload -U +X bashcompinit && bashcompinit
declare -A ZINIT
ZINIT[HOME_DIR]="${HOME}/.config/zinit"
ZINIT[ZCOMPDUMP_PATH]="${HOME}/.cache/zcompdump"
ZINIT[COMPINIT_OPTS]="-C"

source "${HOME}/.config/zinit/zinit.zsh"
#autoload -Uz _zinit
#(( ${+_comps} )) && _comps[zinit]=_zinit

for config (${HOME}/.config/zsh/*.zsh) source $config;

export PATH="$PATH:${HOME}/.local/bin/:/usr/local/cross-compiler/bin"
eval $(thefuck --alias fk)
