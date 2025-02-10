alias gdb="gdb -q"

# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -l'     #size,show type,human readable
alias la='ls -lA'   #long list,show almost all,show type,human readable
alias lr='ls -tR'   #sorted by date,recursive,show type,human readable
alias lt='ls -lt'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias dud='du -d 1 -h'

alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file

export PATH="$PATH:$HOME/.local/bin"
