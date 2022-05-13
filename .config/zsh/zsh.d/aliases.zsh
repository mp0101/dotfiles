#!/usr/bin/zsh
alias "e"="nvim"
alias "cat"="bat"
alias "mkdir"="mkdir -p"
alias "cp"="cp -r"

alias "gittoken"="xclip -select clipboard ${XDG_CONFIG_HOME}/git/gittoken"

alias "add/alias"="$EDITOR $ZDOTDIR/zsh.d/aliases.zsh"
alias "add/ignore"="$EDITOR ${XDG_CONFIG_HOME}/git/gitignore_global"
alias "rm/history"="rm ${ZDOTDIR}/zsh.d/cache/*"

alias "d/nvim"="cd ${XDG_CONFIG_HOME}/nvim"
alias "d/zsh"="cd $ZDOTDIR"

alias "e/zshenv"="$EDITOR $ZDOTDIR/.zshenv"
alias "e/zshrc"="$EDITOR $ZDOTDIR/.zshrc"

alias "s/zshrc"="source ${ZDOTDIR}/.zshrc"

# Aliases pacman
alias "a/options"="pacman"
alias "a/search"="pacman -Ss"
alias "a/install"="sudo pacman -S $argv"
alias "a/update"="sudo pacman -Sy"
alias "a/upgrade"="sudo pacman -Syu"
alias "a/refresh"="sudo pacman -Syyu"
alias "a/remove"="sudo pacman -Rsn $argv"

# Aliases exa
(( ${+commands[exa]} )) && {
  alias tree="exa --tree -s=ext"
  alias ls="exa -l --git"
  alias ls.="exa -l -d --git .*(.)"
  alias lsa="exa -la --git -s=ext"
}

# Aliases fd
(( ${+commands[fd]} )) && {
  alias fd='fd -Hi'
  alias fdg='fd --glob'
  alias fdc='fd --color=always'
  alias fdr='fd --changed-within=20m -d1'
  alias fdrd='fd --changed-within=30m'
  alias fdrr='fd --changed-within=1m'
}
