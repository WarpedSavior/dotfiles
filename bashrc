#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

#Dark theme is broken :(
#alias firefox='env GTK_THEME=Adwaita:light firefox-nightly'

#Telegram
alias telegram='.telegram/Telegram'
alias music='ncmpcpp'
alias usermount='sudo mount -o gid=users,fmask=113,dmask=002' 
alias pcache='pacman -Sc'
alias porphan='pacman -Rns $(pacman -Qtdq)'
