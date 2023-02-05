#!/bin/bash

# enable aliases to be sudoed
alias sudo='sudo '

# short handles and other aliases
alias c='clear'
alias q='exit'
alias cp='cp -i'
alias py='python3'
alias g='git'

# git aliases
alias gs='git status'
alias ga='git add'
alias gd='git ydiff -sw0'
alias gc='git commit'
alias gf='git fetch'
alias gl='git log'
alias gw='git shortlog -nse'
alias gl1='git log --oneline'
alias gls='git log --stat'
alias gll='git log -1 HEAD'
alias glg='git log --graph'

# dotfiles git aliases
alias dg='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias dgs='dg status'
alias dga='dg add'
alias dgd='dg ydiff -sw0'
alias dgc='dg commit'
alias dgf='dg fetch'
alias dgl='dg log'
alias dgw='dg shortlog -nse'
alias dgl1='dg log --oneline'
alias dgls='dg log --stat'
alias dgll='dg log -1 HEAD'
alias dglg='dgl --graph'
alias dgit='dg'
alias dgab='dga ~/.bash_aliases'

# list options
alias ls='ls -v --color=auto'
alias l='ls -lh --time-style="+[%Y-%m-%d] [%H:%M:%S]"'
alias la='l -A'
alias lr='l -R'
alias lt='l -t'
alias ll='ls -lh --time-style="+[%Y-%m-%d] [%H:%M:%S]" --group-directories-first'
alias lla='ll -A'
alias llr='ll -R'
alias llt='lt -r'
alias lls='ls --group-directories-first'
alias ld='ll -d */'

# directory aliases
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias db='cd ~/Dropbox'
alias dk='cd ~/Dokumente'
alias ab='cd ~/Dropbox/Ablage'
alias tf='cd ~/Transfer'

# navigation aliases
alias cd..='cd ..'
alias ..='cd ..'
alias ö='cd ..'
alias ä='cd ..'
alias cd.='cd $(readlink -f .)'	# Go to real dir (i.e. if current dir is linked)
alias cwd='pwd | tr -d \\n | xclip'

# edit this file
alias bedit='vim ~/.bash_aliases'
alias cedit='code ~/.bash_aliases'
alias xedit='xed ~/.bash_aliases'

# refresh this file
alias bref='clear && exec bash'
alias b='bref'

# aliases for updating via apt, pip and pip itself
alias goup='sudo apt update && echo && apt list --upgradable && echo && sudo apt full-upgrade'
alias goupx='sudo apt update && echo && apt list --upgradable && echo && sudo apt full-upgrade -y && exit'
alias pipup='/usr/bin/python3 -m pip install --upgrade pip'
alias pipu='pip freeze --user | cut -d"=" -f1 | xargs -n1 pip install -U'

# specs, system tools and ip aliases
alias spec='sudo lshw'
alias specs='inxi -Fxzm'
alias mint='neofetch'
alias btop='bpytop'
alias ip0='hostname -I | awk "{print \$1}"'
alias ip1='curl ifconfig.me'

# time & date aliases
alias ncal='ncal -Mwb'
alias kw='echo "KW "$(date +%V)'

# python helper tools
alias fd='py $HOME/Workspace/helper_tools/format_date.py'
alias abo='py $HOME/Workspace/helper_tools/ablage_organiser.py'
alias trim='py $HOME/Workspace/helper_tools/trim_whitespaces.py'
alias dupli='python3 $HOME/Workspace/dupli_finder/dupli_finder.py'

# typocorrection
alias mdkir='mkdir'
alias sudu='sudo '

################################################################################
######################## Linux (Mint) specific aliases #########################
################################################################################

if [[ "$(< /proc/version)" != *@(Microsoft|microsoft|WSL|wsl)* ]]; then

# helper tools
alias rewe='python3 $HOME/Workspace/rewe_tools/rewe_tools.py'
alias rewedl='python3 $HOME/Workspace/rewe_tools/rewe_mails.py'
alias rewedir='cd $HOME/Dropbox/Dokumente/Familie/$(date +%Y)/REWE'

# clipboard simplifications
alias xpaste="xclip -o"

# wifi os specific tools
alias wifis='sudo python3 ~/Workspace/read_wifis_linux/read_wifis_linux.py'
alias wifi='echo && sudo grep -lE "^psk=" /etc/NetworkManager/system-connections/* | xargs -I % sudo grep -E "^ssid=|^psk" % | sed -E "s/ssid=|psk=//g" | sed "0~2 a\\\\"'
alias wificonnect='nmcli device wifi list && nmcli device wifi connect $SSID --ask'
alias wifiqr='nmcli device wifi show-password'
alias wlan1='nmcli radio wifi on'
alias wlan0='nmcli radio wifi off'
alias wwan1='nmcli radio wwan on'
alias wwan0='nmcli radio wwan off'

fi

################################################################################
######################## WSL specific aliases ##################################
################################################################################

if [[ "$(< /proc/version)" == *@(Microsoft|microsoft|WSL|wsl)* ]]; then

# getting rid of horibly highlighted folders in WSL
export LS_COLORS=$LS_COLORS:'ow=1;34:';

# windows specific aliases
alias d='cd /mnt/d/'
alias e='explorer.exe .'
alias xclip='clip.exe'
alias xpaste='PowerShell.exe Get-Clipboard'
alias shutdown='PowerShell.exe Stop-Computer -ComputerName localhost'
alias wifi='python3 ~/Workspace/read_wifis_win10/read_wifis_win10.py'

function npp()
{
	'/mnt/c/Program Files/Notepad++/notepad++.exe' $(wslpath -w $@)
}

fi

################################################################################

export WORKSPACE=$HOME/Workspace

# Change Directory to ~/Workspace
ws ()
    {
    cd "${WORKSPACE}/$1"
    }

# Enable tab auto completion for workspace
_ws ()
    {
        local cur

        COMPREPLY=()
        cur=${COMP_WORDS[$COMP_CWORD]}

        targets=$( ls -d $WORKSPACE/$cur* 2>/dev/null | sed "s|$WORKSPACE/||" )

        COMPREPLY=( $( compgen -W "$targets" -- $cur) )
    }

complete -o nospace -F _ws ws

# Create new workspace project, enter folder and initialise repository
nwp ()
    {
        local project=$WORKSPACE/$1
        mkdir $project
        cd $project
        git init
    }

################################################################################

# Snippets
# if [ "$HOSTNAME" == "T460" ]; then
# fi

################################################################################

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# load seperate work related aliases
if [ -f ~/.work_aliases ]; then
	. ~/.work_aliases
fi

################################################################################

# exports
export GPG_TTY=$(tty)
