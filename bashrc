#!/usr/bin/env bash

#  Bash
#######
# PS1='\n\t  : \w \n\u@\h$: '
# PS2='         $  '
if [ $UID -gt 2 ]
    then
        PS1='\n    \[\033[1;31m\]\A | \[\033[1;0m\]\[\033[1;36m\]\w\[\033[1;0m\]\n\[\033[1;33m\]\u@\h \$\[\033[1;0m\] '
    else
        PS1='\n\[\033[1;31m\]\t\[\033[1;0m\]  :\[\033[1;36m\]\w\[\033[1;0m\]\n\[\033[0;31m\]\u\[\033[1;33m\]@\h\$\[\033[1;0m\]\$ '
fi
PS2='         $  '
#PROMPT_COMMAND='if [[ $? -eq 127 ]];then echo;fortune;fi'
PROMPT_COMMAND='[[ $BEEP -gt 0 ]] && beep'

#  Bash
#######
shopt -s histappend
shopt -s checkwinsize
shopt -s cdspell
shopt -u promptvars
export HISTSIZE=500000
export HISTFILESIZE=600000
export PATH=$PATH:~/bin:/var/lib/gems/1.8/bin/
export EDITOR="vim"
export BROWSER="opera"
export PAGER="most"
alias shrc='. ~/.bashrc && clear'
complete -d cd
complete -c which man whatis killall sudo
set -o vi
#set -o noclobber

export PYTHONSTARTUP="/home/john/.pythonrc"


#  Navigation
#############
alias cd..='cd ..'
alias cd-='cd -'

alias pu='pushd'
alias po='popd'


#  Files & Folders
##################
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -v -p'

function mkcd() { mkdir -p -v "$1"; cd "$1"; }

alias ls='ls --color=au -w 50'
alias ll='ls -lArh --color=au'
alias la='ls --color=au -A'
alias lsf='ls -f'
alias l='ls -cr'
function lsd(){ ls -d "$1"*/; }

function lg(){ ls -cr | grep -i $1; }

alias big='du --max-depth=1 | sort -nr | head'
alias duchs='du -chs'

function listdir() { python -c """\
import os
lists = []
for i in os.listdir('.'):
  if os.path.isdir(i) and not i.startswith('.'):
    k = os.listdir(i)
    lists.append( (len(k),i) )
lists.sort()
#print '%3s |  %4s |  %s\n' % ('Rank','Files','Name')
for e,i in enumerate(reversed(lists)):print '%03d  |  %-4d  |  %s' % (e+1,i[0],i[1].title())""" | $PAGER; }

function listdir2() { python -c """\
import os
lists = []
for i in os.listdir('.'):
  if os.path.isdir(i) and not i.startswith('.'):
    lists.append( (sum(os.path.getsize(os.path.join(i,o)) for o in os.listdir(i)),i) )
lists.sort()
for e,i in enumerate(reversed(lists)):print '%03d  |  %-10d  |  %s' % (e+1,i[0],i[1].title())""" | $PAGER; }

#  Internet
###########
alias up='ping -c 1 google.com'

alias scp='scp -r'
alias wget='wget -c'

function goog() {
  url=$(echo google.com/search?q=$(echo "$@" | sed s/\ /+/g))
  opera $url > /dev/null &
  }
function etym(){
    for term in "$@"
    do
        url="http://www.etymonline.com/index.php?term=$term"
        curl -s $url | grep "<dd " | sed 's/<[^>]*>//g' | fold -sw \
            `[ $COLUMNS -lt 80 ] && echo $COLUMNS || echo 79 `
        echo
    done
    }
function thes(){
    for term in "$@" 
    do
        curl -s "onlinethesaurus.co.uk/reference/thesaurus.jsp?q=$term" |
            grep -Po "[0-9]* words for \"$term\".*?<"  |  sed  's/<//g' |
            fold -sw `[ $COLUMNS -lt 80 ] && echo $COLUMNS || echo 79 `
        echo
    done
    }

imgur(){
  for i in "$@";do
    curl -# -F "image"=@"$i" -F "key"="4907fcd89e761c6b07eeb8292d5a9b2a" http://imgur.com/api/upload.xml|\
      grep -Po '(<[\w\d_]+>)http://imgur.com/(\w+/)?[\w\d]+(\.\w{1,3})?'|\
      sed -e 's/^<//g;s/^./\U&/g;s/_/ /g;s/>/: /g;s/ ./\U&/'|\
      awk '{sub(/^/,"\033[0;34m");sub(/:/,"\033[0m:");print}'
  done
}


#  Media
########
alias mpl='mplayer -really-quiet &> /dev/null'
alias vmpl='mplayer -fs -aspect 16:9 -really-quiet'
alias rfeh='feh -rFZ'
alias zfeh='feh -rFzZ'
alias feh='feh -FZ'

function m(){
    [ -$# -eq 0 ] && mplayer *mp3 || for arg in $@; do mplayer *$arg*;done; 
}

complete -f mpl vmpl rfeh zfeh m

function prns(){
    time=$(date +%F--%H:%M:%S)
    scrot "$time.png" -e "mv $time.png ~/docs/printscreen/" -q 85
    }
function prnsi(){
    time=$(date +%F--%H:%M:%S)
    scrot "$time.png" -s -e "mv $time.png ~/docs/printscreen/" -q 85
    }


#  Packages
###########
alias sag='sudo apt-get'

alias sagi='sudo apt-get install'
alias sagr='sudo apt-get remove'
alias sagR='sudo apt-get autoremove'
alias sagc='sudo apt-get update && sudo apt-get autoclean'

alias sags='apt-cache search'

alias yag='yaourt'
alias yagi='yaourt -S'
alias yagr='yaourt -R'
alias yagR='yaourt -Rns'
alias yags='yaourt -Ss'

complete -c sagr sagR yagr yagR


#  Miscellenea
##############
alias ka='killall'
alias c='clear'
alias nano='nano -BELOwx -T 4'
alias xt='xterm -e "bash" &' # open another xterm in current directory
alias ctw='ctw UKXX0015'

alias mp='sudo modprobe acpi-cpufreq;sudo cpufreq-set -g ondemand'
alias keys='xset r rate 150 20;setxkbmap gb'

#  Common Errors...
################
alias alsam='alsamixer'
alias alasm='alasmixer'
alias ht='htop'
alias print='echo'
alias feg='feh'
alias oython='python'
alias import='python'
alias greo='grep'
alias zpdf='xpdf'
alias cpi='acpi'
alias vom='vim'
alias com='vim'

