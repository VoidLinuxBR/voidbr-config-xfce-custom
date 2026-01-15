# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin:/usr/games:/sbin:$HOME/bin"

#Isso força o dialog a usar caracteres ASCII básicos para as bordas.
#Testa se o terminal suporta caracteres gráficos estendidos
#if [[ "$LANG" =~ 'UTF-8' ]]; then
if [[ "$(printf '\u250C')" =~ "┌" ]]; then
  export NCURSES_NO_UTF8_ACS=1  # Terminal suporta ACS
else
  export NCURSES_NO_UTF8_ACS=0  # Terminal NÃO suporta ACS
fi

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ----- History Configuration -----
HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
shopt -s histappend    # append to the history file, don't overwrite it
HISTSIZE=1000          # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTFILESIZE=2000      # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
# Automatically adjust terminal size
shopt -s checkwinsize

# ----- Color Support for ls -----
if command -v dircolors >/dev/null 2>&1; then
	eval "$(dircolors -b ~/.dircolors 2>/dev/null || dircolors -b)"

	# Customize LS_COLORS to make tudo azul claro
	export LS_COLORS='di=1;34:fi=0;34:ln=1;36:*.txt=0;34:*.sh=0;34:*.log=0;34'

	alias ls='ls --color=always' # Garantir cores no ls
fi

# Useful aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# ----- Function: Extract Archives -----
ex() {
	if [ -f "$1" ]; then
		case "$1" in
		*.tar.bz2) tar xjf "$1" ;;
		*.tar.gz) tar xzf "$1" ;;
		*.bz2) bunzip2 "$1" ;;
		*.rar) unrar x "$1" ;;
		*.gz) gunzip "$1" ;;
		*.tar) tar xf "$1" ;;
		*.tbz2) tar xjf "$1" ;;
		*.tgz) tar xzf "$1" ;;
		*.zip) unzip "$1" ;;
		*.Z) uncompress "$1" ;;
		*.7z) 7z x "$1" ;;
		*) echo "'$1' cannot be extracted via ex()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# Load custom aliases from ~/.bash_aliases if it exists
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Enable programmable completion features if available
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
	. /etc/bash_completion
fi

[ -f /usr/share/doc/pkgfile/command-not-found.bash ] && source /usr/share/doc/pkgfile/command-not-found.bash
[ -f ~/.fzf.bash ] && . ~/.fzf.bash
[ -f ~/.bashrcfull ] && . ~/.bashrcfull
[ -f ~/.bashrckali ] && . ~/.bashrckali
[ -f /etc/bashrc ] && . /etc/bashrc
[ -f ~/.bashrckali ] && . ~/.bashrckali

# ----- Prompt Configuration -----
# Cores ajustadas para azul com branco
if [[ ${EUID} == 0 ]]; then
	PS1='\[\033[48;2;0;91;187;38;2;255;255;255m\]\$\[\033[48;2;0;115;230;38;2;0;91;187m\]\[\033[48;2;0;115;230;38;2;255;255;255m\]\h\[\033[48;2;60;63;65;38;2;0;115;230m\]\[\033[48;2;60;63;65;38;2;255;255;255m\]\w\[\033[49;38;2;60;63;65m\]\[\033[00m\]'
else
	PS1='\[\033[48;2;0;91;187;38;2;255;255;255m\]\$\[\033[48;2;0;115;230;38;2;0;91;187m\]\[\033[48;2;0;115;230;38;2;255;255;255m\]\u@\h\[\033[48;2;60;63;65;38;2;0;115;230m\]\[\033[48;2;60;63;65;38;2;255;255;255m\]\w\[\033[49;38;2;60;63;65m\]\[\033[00m\]'
fi

