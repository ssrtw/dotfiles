# install zinit if it isn't already installed
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
  print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
  command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
  command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

# load zinit
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# can't load this one in turbo mode, abbr is used in aliases.zsh
zinit light olets/zsh-abbr


zinit ice wait lucid for \
  OMZL::key-bindings.zsh \
  OMZL::history.zsh \
  OMZP::sudo \
  junegunn/fzf \
  Aloxaf/fzf-tab \
  multisrc'shell/{completion,key-bindings}.zsh' id-as'junegunn/fzf_completions' pick'/dev/null'

zinit ice lucid nocompile
zinit load ael-code/zsh-colored-man-pages

# 自動補全大禮包 {
zinit wait lucid light-mode for \
  zsh-users/zsh-history-substring-search \
  greymd/docker-zsh-completion \
  atinit"zicompinit; zicdreplay" \
      zdharma-continuum/fast-syntax-highlighting \
  blockf \
    zsh-users/zsh-completions \
  atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions
# 自動補全大禮包 }

# fzf style
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'