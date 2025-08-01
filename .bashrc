#!/bin/bash
## ~/.bashrc: configuration for interactive bash shells


## Exit if not running interactively
case $- in *i*) ;; *) return;; esac


## History configuration
HISTSIZE=104857600
HISTFILESIZE=104857600
HISTTIMEFORMAT="%F %T  "
HISTCONTROL=ignorespace
HISTIGNORE='c:bedit:bref:b:rm*:l:ls:ll:ö:ä:ü'
shopt -s histappend


## Shell options
shopt -s checkwinsize   # Update linrs and columns after each command
shopt -s cdspell        # Auto-correct typos in cd commands, e.g. "cd /usr/lcoal/bin" -> "/usr/local/bin"
shopt -s globstar       # Enable ** for recursive path expansion


## Prompt configuration
color_prompt=yes

case $(id -u):$(< /proc/version) in
    0:*)  # Root user - red background prompt
          PS1='\[\033[01;41m\]\u@\h\[\033[00m\]:\[\033[01;31m\]\w\[\033[00m\]\$ ';;
  *WSL*)  # WSL user - green prompt
          PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ';;
      *)  # Standard Linux - blue prompt
          PS1='\[\033[01;94m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ ';;
esac

# Add window title to prompt
PS1="\[\e]0;\u@\h: \w\a\]$PS1"


## Load custom aliases
[[ -f $HOME/.bash_aliases ]]  && source $HOME/.bash_aliases


## Bash completion
[[ -f /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion
[[ -f /etc/bash_completion ]] && source /etc/bash_completion


## Environment setup
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# Set LESSCHARSET to UTF-8 to correctly display non-ASCII characters
# needed for git ydiff, as git is dumping out raw bytes to the pager
# which in most cases would be "less"
export LESSCHARSET=utf-8

## FZF Integration
# Configure bash specific fzf completions
# fzf --bash exists in upstream versions, which has not made it to most distro repositories yet
if command -v fzf > /dev/null; then
  { fzf --bash > /dev/null 2>&1 && eval "$(fzf --bash)"; } || 
  source /usr/share/doc/fzf/examples/key-bindings.bash 2>/dev/null
fi
