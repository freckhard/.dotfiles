#!/bin/bash


# enable aliases to be sudoed
alias sudo='sudo '

# short handles and other aliases
alias c='clear'
alias q='exit'
alias cp='cp -i'
alias g='git'

# Python and python environment aliases
alias py='python3'
alias ipy='ipython3'

# git aliases
alias gs='git status -u'
alias ga='git add'
alias gd='git ydiff -sw0'
alias gc='git commit'
alias gf='git fetch'
alias gl='git log'
alias gw='git shortlog -nse'
alias gl1='git log --oneline'
alias gls='git log --stat'
alias glS='git log --show-signature'
alias gll='git log -1 HEAD'
alias glg='git log --graph'
alias gds='git ydiff -sw0 --staged'
alias gL='git log --oneline --graph --pretty=format:"%C(yellow)%h%Creset %G? %C(blue)%an%Creset %s"'

# dotfiles git aliases
alias dg='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias dgs='dg status'
alias dga='dg add'
alias dgd='dg ydiff -sw0'
alias dgc='dg commit'
alias dgf='dg fetch'
alias dgl='dg log'
alias dgw='dg shortlog -nse'
alias dgit='dg'
alias dgl1='dg log --oneline'
alias dgls='dg log --stat'
alias dgll='dg log -1 HEAD'
alias dglg='dgl --graph'
alias dgds='dgd --staged'
alias dglS='dg log --show-signature'
alias dgab='dga ~/.bash_aliases'
alias dgL='dg log --oneline --graph --pretty=format:"%C(yellow)%h%Creset %G? %C(blue)%an%Creset %s"'

# list options
alias ls='ls -v --color=auto'
alias l='ls -lh --time-style="+[%Y-%m-%d] [%H:%M:%S]" --group-directories-first'
alias la='l -A'
alias lat='l -At'
alias latr='l -Atr'
alias lr='l -R'
alias lt='l -t'
alias ltr='l -tr'
alias ll='ls -lh --time-style="+[%Y-%m-%d] [%H:%M:%S]"'
alias lla='ll -A'
alias llr='ll -R'
alias llt='lt -r'
alias lls='ls --group-directories-first'
alias ld='ll -d */'
alias lda='la -d .*/'
alias lld='la -d */ -d .*/'
alias lsa='ls -A --group-directories-first'

# directory aliases
alias ab='cd ~/Daten/Ablage'
alias av='cd ~/Daten/Archiv'
alias da='cd ~/Daten'
alias dk='cd ~/Documents'
alias dl='cd ~/Downloads'
alias dt='cd ~/Desktop'
alias d='cd /vol/data'
alias vol='cd /vol/'
alias data='cd /vol/data'
alias lore='cd /vol/lore'

# navigation aliases
alias cd..='cd ..'
alias ..='cd ..'
alias ö='cd ..'
alias ä='cd ..'
alias cd.='cd $(realpath .)'	# Go to real dir (i.e. if current dir is linked)
alias cwd='pwd | tr -d \\n | xclip'
alias open='xdg-open'
alias e='f(){ open "${1:-.}"; }; f'
alias rp='f() { realpath "${1:-.}"; }; f'

# edit this file
alias bedit='vim ~/.bash_aliases'
alias cedit='code ~/.bash_aliases'
alias xedit='xed ~/.bash_aliases'
alias kedit='kate ~/.bash_aliases'
alias zedit='vim ~/.zsh_aliases'

# refresh bash config
alias bref='clear && exec bash'
alias b='source $HOME/.bashrc'

# aliases for updating package manager packages
alias goup='sudo apt update && echo && apt list --upgradable && echo && sudo apt full-upgrade'
alias goupx='sudo apt update && echo && apt list --upgradable && echo && sudo apt full-upgrade -y && exit'
alias fup='flatpak update -y'

# specs, system tools and ip aliases
alias spec='sudo lshw'
alias specs='inxi -Fxzm'
alias mint='neofetch'
alias ip0='hostname -I | awk "{print \$1}"'
alias ip1='curl ifconfig.me'
alias hostname='uname -n'

# wireguard vpn aliases
alias wg1='sudo wg-quick up wg0'
alias wg0='sudo wg-quick down wg0'
alias wgs='sudo wg show'

# time & date aliases
alias ncal='ncal -Mwb'
alias kw='echo "KW "$(\date +%V)'
alias date='date "+%F | KW %V | %A | %T %z"'

# software aliases
alias rga='rga --rga-adapters=poppler -l 2>/dev/null'
rgao() { rga "$@" | xargs -I {} wsl-open "{}"; }

# python helper tools
alias trim='py $HOME/Workspace/helper_tools/trim_whitespaces.py'
alias xfd='py $HOME/Workspace/helper_tools/format_date.py'
alias ablo='uv run --project $HOME/Daten/Eckhard/Projekte/ablage-scan-organiser $HOME/Daten/Eckhard/Projekte/ablage-scan-organiser/main.py'
alias dupli='uv run --project $HOME/Workspace/dupli_finder $HOME/Workspace/dupli_finder/dupli_finder.py'
alias eezy='uv run --project $HOME/Workspace/eezy $HOME/Workspace/eezy/main.py'

# miscellaneous tools
alias t='tail -f'
alias ff='fastfetch'
alias fs='fsearch'
alias ciso='sha256sum -c sha256sums.txt --ignore-missing && b2sum -c b2sums.txt --ignore-missing'

# get filecount including dotfiles from current or target directory
alias n='f(){ (cd "${1:-.}" && shopt -s nullglob dotglob && files=( * ) && echo "${#files[@]}"); }; f'
alias nl='for dir in */; do echo -n "$dir: "; fd . --hidden "$dir" | wc -l; done'
alias wcl='wc -l'

# typo correction
alias mdkir='mkdir'
alias sudu='sudo '

## Color support for grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# helper tools
alias rewe='uv run --project $HOME/Workspace/rewe_tools $HOME/Workspace/rewe_tools/rewe_tools.py'
alias rewedl='uv run --project $HOME/Workspace/rewe_tools $HOME/Workspace/rewe_tools/rewe_mails.py'
alias rewedir='cd $HOME/Daten/Archiv/Familie/$(\date +%Y)/REWE'


################################################################################
######################## Linux (Mint) specific aliases #########################
################################################################################

if [[ "$(< /proc/version)" != *WSL* ]]; then

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

alias uefi='sudo systemctl reboot --firmware-setup'

alias fh='flatpak search'

fi


################################################################################
######################## WSL specific aliases ##################################
################################################################################

if [[ "$(< /proc/version)" == *WSL* ]]; then

# getting rid of horribly highlighted folders in WSL
export LS_COLORS=$LS_COLORS:'ow=1;34:';

alias nedit='npp $HOME/.bash_aliases'

# windows specific aliases
alias d='cd /mnt/d/'
alias dk='cd ~/Dokumente'
alias xclip='clip.exe'
alias xpaste='pwsh.exe -NoProfile -Command "[Console]::OutputEncoding=[Text.Encoding]::UTF8; Get-Clipboard"'
alias shutdown='PowerShell.exe Stop-Computer -ComputerName localhost'
alias wifi='python3 ~/Workspace/read_wifis_win10/read_wifis_win10.py'
alias ssh="ssh.exe"
alias ssh-add='ssh-add.exe'

# The generic open alias (xdg-open) from above must go in WSL, otherwise it would
# shadow an 'open' executable in PATH (aliases always win over executables in
# interactive shells). If no such executable exists, fall back to the alias below.
unalias open 2>/dev/null
if [[ ! -f "$HOME/.local/bin/open" ]]; then
	alias open='WslOpenExe="powershell.exe -NoProfile Start" wsl-open'
fi

if [[ ! -f "$HOME/.local/bin/npp" ]]; then
	function npp()
	{
		'/mnt/c/Program Files/Notepad++/notepad++.exe' $(wslpath -w $@)
	}
fi

# WSL-specific exports
export RSYNC_RSH="ssh.exe"

fi


################################################################################

# workspace definitions
export WORKSPACE=$HOME/Workspace

# Change directory to ~/Workspace with ws
# Change directory to ~/Workspace/<folder> with ws <folder>
ws ()
    {
    cd "${WORKSPACE}/$1"
    }

# Create new workspace project, enter folder and initialise git repository
nwp ()
    {
        local project=$WORKSPACE/$1
        mkdir $project
        cd $project
        git init
    }

# Enable tab auto completions
# autocomplete for the ws workspace command
_ws ()
    {
        local cur

        COMPREPLY=()
        cur=${COMP_WORDS[$COMP_CWORD]}

        targets=$( ls -d $WORKSPACE/$cur* 2>/dev/null | sed "s|$WORKSPACE/||" )

        COMPREPLY=( $( compgen -W "$targets" -- $cur) )
    }

complete -o nospace -F _ws ws

# autocomplete for pip
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 2>/dev/null ) )
}
complete -o default -F _pip_completion pip

################################################################################
# Loaders section of different things, like paths, initialisers, evals and exports

# set PATH so it includes user's private bin if it exists
if [[ -d "$HOME/.local/bin" ]]; then PATH="$HOME/.local/bin:$PATH"; fi

# set PATH so it includes rust's cargo bin if it exists
if [[ -d "$HOME/.cargo/bin" ]]; then PATH="$HOME/.cargo/bin:$PATH"; fi

# load separate work related aliases if it exists
if [[ -f $HOME/.work_aliases ]]; then source $HOME/.work_aliases; fi

# load local nix-profile binary path if it exists
if [[ -d "$HOME/.nix-profile/bin" ]]; then export PATH=$HOME/.nix-profile/bin:$PATH; fi

# Configure shell environment for command-line tools if they exist
command -v vim > /dev/null && export EDITOR=vim
command -v pipx > /dev/null && eval "$(register-python-argcomplete3 pipx)"
command -v zoxide > /dev/null && eval "$(zoxide init --cmd cd bash)" 

################################################################################
# Function definitions, aliases, defaults and for fzf fuzzyfinder
# https://github.com/phiresky/ripgrep-all/wiki/fzf-Integration

alias fo='open $(fzf)'

rga-fzf() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
		fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
		    --phony -q "$1" --bind "change:reload:$RG_PREFIX {q}" \
		    --preview-window="70%:wrap")" &&
	echo "opening $file" &&
	xdg-open "$file"
}

export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git --exclude /timeshift'

################################################################################
# history appender, for a complete history when using more than one terminal
# declared in this special way to be compatible with the zoxide navigation package
prompt_command_function() {
  __zoxide_hook
  history -a
}
command -v zoxide > /dev/null && export PROMPT_COMMAND=prompt_command_function
command -v zoxide > /dev/null && export _ZO_DOCTOR=0

# necessary export for gpg-agent invocation
export GPG_TTY=$(tty)

# flatpak and userspaces
export XDG_DATA_DIRS="/var/lib/flatpak/exports/share:/usr/local/share:/usr/share:$HOME/.local/share/flatpak/exports/share"

