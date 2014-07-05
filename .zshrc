# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _match _approximate _prefix
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/stefan/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
# End of lines configured by zsh-newuser-install


bindkey "^[OH" beginning-of-line
bindkey "^[OF" end-of-line


autoload -U colors && colors


USER_PROMPT="%n"
HOST_PROMPT="%{$fg[cyan]%}%M%{$reset_color%}"
PATH_PROMPT="%B%~%b"

PREFIX1="╭"
PREFIX2="╰"

if [[ $TERM == "linux" ]] ; then
  PREFIX1="┌"
  PREFIX2="└"
fi

if [ $(id -u) -lt "501" ] ; then
  USER_PROMPT="%{$fg[red]%}%n%{$reset_color%}"
else
  USER_PROMPT="%{$fg[green]%}%n%{$reset_color%}"
fi

# Aliases
alias l='ls -CF'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [[ -f ~/.zsh_aliases ]]; then
    . ~/.zsh_aliases
fi

PROMPT="$PREFIX1 $USER_PROMPT@$HOST_PROMPT:$PATH_PROMPT 
$PREFIX2→ "
RPROMPT="%{$fg[cyan]%} ◂%{$reset_color%}"

export EDITOR="vi"
export RASPPI="harry@myraspberrypi.no-ip.org"

# Update the PATH
export JAVA_HOME=/opt/java/jdk1.7.0_51/
export PATH=${PATH}:~/bin:/opt/java/jdk1.7.0_51/bin/

