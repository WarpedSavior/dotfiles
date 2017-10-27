#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

#Dark theme is broken :(
alias firefox='env GTK_THEME=Adwaita:light firefox-nightly'

#Telegram
alias telegram='.telegram/Telegram'
alias music='ncmpcpp'
alias usermount='sudo mount -o gid=users,fmask=113,dmask=002' 
