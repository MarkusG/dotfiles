HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory notify

zstyle :compinstall filename '/home/mark/.zshrc'

# Enable arrow key autocompletion menu
zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
setopt COMPLETE_ALIASES

fpath=( "$HOME/.zfunctions" $fpath)

autoload -Uz compinit promptinit
promptinit
compinit

prompt pure

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Change terminal title
autoload -Uz add-zsh-hook

function xterm_title_precmd () {
	print -Pn '\e]2;%n@%m: %1~\a'
}

function xterm_title_preexec () {
	print -Pn '\e]2;%n@%m: %1~ %# '
	print -n "${(q)1}\a"
}

if [[ "$TERM" == (screen*|xterm*|rxvt*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi

source ~/.zaliases

# Make sudo recognize aliases
alias sudo='sudo '

# make gpg work with git and ssh
export GPG_TTY=$(tty)
echo UPDATESTARTUPTTY | gpg-connect-agent > /dev/null

cat ~/todo.txt
