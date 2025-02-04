# custom zsh config location
ZSH_CUSTOM="$HOME/.config/zsh"

# load all zsh config
for config (${HOME}/.config/zsh/*.zsh) source $config;
