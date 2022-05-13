#!/usr/bin/env zsh
export LANGUAGE="en_US.UTF-8"
export LANG="$LANGUAGE"
export LC_ALL="$LANGUAGE"
export TERM="tmux-256color"
export WORKSPACE="$HOME/Workspaces"
export TMP=${TMP:-${TMPDIR:-/tmp}}
export TMPDIR=$TMP

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
# export XDG_BIN_HOME="$HOME/.bin"
# export XDG_MBIN_HOME="$HOME/.mybin"
# export BACKUP_DIR="$HOME/.backup"

export SHELL="/usr/bin/zsh"
export TERMINAL="alacritty"
export BROWSER="firefox"

export EDITOR="nvim"
export VISUAL="nvim"

export GIT_EDITOR="${EDITOR}"
export RTV_EDITOR="${EDITOR}"
export RGV_EDITOR="${EDITOR} $file +$line"
export SYSTEMD_COLORS=1

export MANPAGER="nvim +Man!"

export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export HISTFILE="${ZDOTDIR}/zsh.d/cache/history.zsh"
export HISTSIZE=10000
export SAVEHIST=10000

export GNUPGHOME="${XDG_CONFIG_HOME}/gnupg"
export GPG_AGENT_INFO="${GNUPGHOME}/S.gpg-agent"

export GTK_USE_PORTAL=1
export GTK_THEME_VARIANT=dark
export QT_QPA_PLATFORMTHEME=qt5ct

export UMCONFIG_HOME="${XDG_CONFIG_HOME}/unconfig"
export NOTMUCH_CONFIG="${XDG_CONFIG_HOME}/notmuch/notmuch-config"

export BAT_CONFIG_PATH="${XDG_CONFIG_HOME}/bat/config"

export LUAROCKS_CONFIG="${XDG_CONFIG_HOME}/luarocks/config.lua"

export CARGO_HOME="${XDG_DATA_HOME}/cargo"

export GOROOT="${XDG_DATA_HOME}/goroot"
export GOPATH="${XDG_DATA_HOME}/gopath"
export GOCACHE="${XDG_CACHE_HOME}/go-build"
export GOBIN="${GOROOT}/bin"

export NPM_CONFIG_PREFIX="${XDG_CONFIG_HOME}/npm"
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export NPM_PACKAGES="${XDG_CONFIG_HOME}/npm-packages"
