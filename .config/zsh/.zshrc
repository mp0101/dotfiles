#!/usr/bin/zsh
fpath+=${ZDOTDIR}/plugins.d/typewritten
autoload -U promptinit; promptinit
prompt typewritten

TYPEWRITTEN_PROMPT_LAYOUT="singleline"
TYPEWRITTEN_SYMBOL="$"
TYPEWRITTEN_CURSOR="block"
TYPEWRITTEN_ARROW_SYMBOL="➜"
TYPEWRITTEN_RELATIVE_PATH="home"

setopt autocd
setopt correct
setopt extended_glob

setopt extended_history
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_verify

# Sources Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh

# Sources Aditionals ZSH Conf
source $ZDOTDIR/zsh.d/*.zsh
