bindkey '^E' end-of-line              # [Ctrl-E] - Jump to the end of the line
bindkey '^[[P' delete-char            # [Delete] - Delete character under cursor
bindkey '^[[4~' end-of-line           # [End] - Go to end of line
bindkey '^[[3~' delete-char           # [Delete] - Delete character under cursor
bindkey '^A' beginning-of-line        # [Ctrl-A] - Jump to the start of the line
bindkey '^[[1;5C' forward-word        # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word       # [Ctrl-LeftArrow] - move backward one word
bindkey '^[[H' beginning-of-line      # [Home] - Go to beginning of line
bindkey '^?' backward-delete-char     # [Backspace] - Delete backward
bindkey '^[[5~' up-line-or-history    # [PageUp] - Up a line of history
bindkey '^[[6~' down-line-or-history  # [PageDown] - Down a line of history
# bindkey '^[[Z' reverse-menu-complete  # [Shift-Tab] - move through the completion menu backwards
bindkey '^r' history-incremental-search-backward  # [Ctrl-r] - Search backward incrementally for a string.
bindkey '^H' backward-kill-word       # [Ctrl-Backspace] - Delete previous work

autoload -z edit-command-line # [Ctrl + X, Ctrl + E] - Edit command in vim
zle -N edit-command-line
bindkey "^X^E" edit-command-line

#   Arrow keys search history
zle -N history-substring-search-up
zle -N history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

autoload -U select-word-style
select-word-style bash
export WORDCHARS='.-'
