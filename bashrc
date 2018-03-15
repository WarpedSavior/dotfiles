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
alias pcache='sudo pacman -Sc'
alias porphan='sudo pacman -Rns $(pacman -Qtdq)'

extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

note ()
{
        #if file doesn't exist, create it
        [ -f ~/.notes ] || touch ~/.notes

        #no arguments, print file
        if [ $# = 0 ]
        then
                cat $HOME/.notes
        #clear file
        elif [ $1 = -c ]
        then
                > ~/.notes
        #add all arguments to file
        else
                echo "$@" >> ~/.notes
        fi
}