################################################################################
#  Local Variables
OPERA="opera -private -nomail -nolirc"

#  Terminal
# PS1='\n\t  : \w \n\u@\h$: '
# PS2='         $  '
if [ $UID -gt 2 ]
then
PS1='\n     \[\033[1;31m\]\A\[\033[1;0m\]: \[\033[1;36m\]\w\[\033[1;0m\]\n\[\033[1;33m\]\u@\h\$\[\033[1;0m\]: '
else
PS1='\n\[\033[1;31m\]\t\[\033[1;0m\]  : \[\033[1;36m\]\w\[\033[1;0m\]\n\[\033[0;31m\]\u\[\033[1;33m\]@\h\$\[\033[1;0m\]: '
fi
PS2='         $  '
PROMPT_COMMAND='if [[ $? -eq 127 ]];then echo;fortune;fi'

#  BASh
shopt -s histappend
shopt -s checkwinsize
shopt -s cdspell
shopt -u promptvars
export HISTSIZE=500000
export HISTFILESIZE=600000
export PATH=$PATH:~/bin
export EDITOR="vim"
alias shrc='. ~/.bashrc && clear'
export PAGER="most"
complete -d cd 
complete -c which man whatis killall sudo
set -o vi

#  Navigation
alias ,='cd -'
alias ↑='cd ..'

alias pu='pushd'
alias po='popd'

#  Files & Folders
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -v -p'

function mkcd() { mkdir -p -v "$1"; cd "$1"; }

alias ls='ls --color=au -w 50'
alias ll='ls -lArh --color=au'
alias lsd='ls --color -d  */'
alias lsf='lf -f'

alias big='du --max-depth=1 | sort -nr | head'
alias home='cd ~ && clear'


#  Internet
alias up='ping -c 1 google.com'

alias scp='scp -r'
alias wget='wget -c'
function goog() { 
  url=$(echo google.com/search?q=$(echo "$@" | sed s/\ /+/g)) 
  "$OPERA $url" >> /dev/null &
  }
function etym() { 
  url=$(echo etymonline.com/index.php?search=$(echo "$@" | sed s/\ /+/g))
  "$OPERA $url" >> /dev/null &
  }

#  Media
alias mpl='mplayer -really-quiet &> /dev/null'
alias vmpl='mplayer -fs -aspect 16:9 -really-quiet'
alias rfeh='feh -rFZ'
alias zfeh='feh -rFzZ'
alias feh='feh -FZ'

complete -f mpl vmpl rfeh zfeh

function prns(){
    time=$(date +%F--%H:%M:%S)
    scrot "$time.png" -e "mv $time.png ~/docs/printscreen/" -q 85
    }
function prnsi(){
    time=$(date +%F--%H:%M:%S)
    scrot "$time.png" -s -e "mv $time.png ~/docs/printscreen/" -q 85
    }



#  Packages
alias sag='sudo apt-get'

alias sagi='sudo apt-get install'
alias sagr='sudo apt-get remove'
alias sagR='sudo apt-get autoremove'
alias sagc='sudo apt-get update && sudo apt-get autoclean'

alias sags='apt-cache search'


#  Miscellenea
alias ka='killall'
alias c='clear'
alias nano='nano -BELOxw -T 4'

#  Common Errors...
alias print='echo'
alias feg='feh'
alias cd..='cd ..'
alias cd~='cd ~'
alias oython='python'
alias greo='grep'

alias mp='sudo modprobe acpi-cpufreq;sudo cpufreq-set -g ondemand'
alias keys='xset r rate 150 20;setxkbmap gb'
