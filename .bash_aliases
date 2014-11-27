# some more ls aliases
alias ll='ls -alF'
alias l='ls -CF'
#AZERTY
alias fr='setxkbmap fr' 
#QWERTY
alias us='setxkbmap us' 
# Some cool aliases
alias update='sudo pacman -Syyu'
alias install='sudo pacman -S'
alias search='sudo pacman -Ss'
alias remove='sudo pacman -Rs'
alias clean='sudo pacman -Scc'
alias orphan='sudo pacman -Rns $(pacman -Qtdq)'
alias aurin='yaourt -S'
alias aurse='yaourt -Ss'
alias aurup='yaourt -Syua'
alias aurinen='LC_ALL=C yaourt -S'
alias stayonmypc="sudo pacman -D --asexp"
alias fuckoff="sudo pacman -D --asdep"
alias pacinf="sudo pacman -Si"
alias searchlocal="sudo pacman -Qs"
alias listfiles="sudo pacman -Ql"
alias whoisorphan="sudo pacman -Qdt"

# Add an "alert" alias for long running commands.  Use like so:
#   sleepkkkkkkkk 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Games Aliases
alias Monkey2='cd ~/.wine32/drive_c/Program\ Files/Monkey\ Island\ 2\ LeChucks\ Revenge\ Special\ Edition/; WINEARCH=win32 WINEPREFIX=~/.wine32 wine Monkey2.exe; cd ~/'
alias Monkey1='cd ~/.wine32/drive_c/Program\ Files/Secret\ Of\ Monkey\ Island\ SE/; WINEARCH=win32 WINEPREFIX=~/.wine32 wine MISE.exe; cd ~/'
alias SystemShock2='cd ~/.wine32/drive_c/GOG\ Games/System\ Shock\ 2/; WINEARCH=win32 WINEPREFIX=~/.wine32 wine Shock2.exe; cd ~/'
alias DK2='cd ~/.wine64/drive_c/GOG\ Games/Dungeon\ Keeper\ 2/; WINEPREFIX=~/.wine64 wine DKII.exe; cd ~/'
