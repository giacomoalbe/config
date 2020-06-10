#################
# ALIAS SECTION #
#################

alias dc=docker-compose
alias dcp="docker-compose -f docker-compose.prod.yml"
alias dl="docker-compose logs -f"
alias g=git
alias d=docker
alias t=tmux
alias vim=nvim
alias c=clear
alias ev="vim ~/.bashrc"
alias sv="source ~/.bashrc"
alias ea="vim ~/.bash_aliases"

alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tk="tmux kill-session -t"
alias tl="tmux ls"

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias pi="sudo pacman -S "
alias vl="io.elementary.vala-lint ."
alias open="xdg-open"
alias reloadkc="xmodmap ~/.Xmodmap"
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

cd() { builtin cd "$@" && ls -lG ; }

alias ls="ls -h"

alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gl="git log --pretty=format:'%ad [%an] | %s' --date=format:'%d/%m/%y %H:%M'"
alias glh="git --no-pager log --pretty=tformat:'%ad %C(Yellow)%h%C(reset) %C(blue)[%an]%C(reset) | %s' --date=format:'%d/%m/%y %H:%M' -10"
alias glt="git log --pretty=format:'%h %ad | %s [%an]' --author=Giacomo  --date=format:\"%d/%m/%y %H:%M\" --since=\$(date +%Y-%m-%d) | tee"

# Portusage
alias portusage="sudo netstat -tulpn"

# HLedger
alias hl="hledger"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias rfc="fc-cache -f -v"
