# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

for d in ~/apps/*;
    do PATH=$PATH:$d
done

export LD_LIBRARY_PATH=/usr/local/lib

PATH=$PATH:/home/giacomo/Matlab/bin
PATH=$PATH:/home/giacomo/apps/telegram/bin
PATH=$PATH:/home/giacomo/apps/mongodb/bin
PATH=$PATH:/home/giacomo/.local/bin
PATH=$PATH:/home/giacomo/.npm/bin
PATH=$PATH:/home/giacomo/.cargo/bin
PATH=$PATH:/snap/bin
PATH=$PATH:/home/giacomo/.config/composer/vendor/bin

export LD_LIBRARY_PATH=/usr/local/lib
export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python3.5/site-packages

alias dc=docker-compose
alias dcp="docker-compose -f docker-compose.prod.yml"
alias dl="docker-compose logs -f"
alias g=git
alias d=docker
alias t=tmux
alias vim=nvim
alias cl=clear
alias ev="vim ~/.bashrc"
alias sv="source ~/.bashrc"

alias tn="tmux new -s"
alias ta="tmux attach -t"
alias tk="tmux kill-session -t"
alias tl="tmux ls"

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias pi="sudo pacman -S "

cd() { builtin cd "$@" && ls -l --color; }

alias ls="ls -h --color=auto"

alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gl="git log --pretty=format:'%ad [%an] | %s' --date=format:'%d/%m/%y %H:%M'"
alias glh="git log --pretty=format:'%ad [%an] | %s' --date=format:'%d/%m/%y %H:%M' | head"
alias glt="git log --pretty=format:'%h %ad | %s [%an]' --author=Giacomo  --date=format:\"%d/%m/%y %H:%M\" --since=\$(date +%Y-%m-%d) | tee"

# Portusage
alias portusage="sudo netstat -tulpn"

# HLedger
alias hl="hledger"

export PS1='\[\033[01;32m\]\u@\h \[\033[00;31m\]\W \$ \[\033[00m\]'

function queryfont {
  fc-list | grep "$1" | awk -F ":" '{print $2 "\t" $3}'
}

###-tns-completion-start-###
if [ -f /home/giacomo/.tnsrc ]; then
    source /home/giacomo/.tnsrc
fi

###-tns-completion-end-###
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# RLS
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# NPM
export PATH=~/.npm-global/bin:$PATH

# ANDROID
export ANDROID_HOME=~/.android-sdk
export PATH=$PATH:$ANDROID_HOME/emulator/
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools/bin
export PATH=$PATH:$ANDROID_HOME/build-tools/25.0.2/

# Fixes sdkmanager error with java versions higher than java 8
#export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'

# JAVA
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$PATH:$JAVA_HOME/bin

# FLUTTER
export FLUTTER_HOME=~/flutter
export PATH=$PATH:$FLUTTER_HOME/bin

# DART
export PATH=$FLUTTER_HOME/bin/cache/dart-sdk/bin:$PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"

# CUSTOM SCRIPT
export PATH=~/.scripts:$PATH

# XAMPP
export PATH=$PATH:/opt/lampp

# Change default pager
export PAGER="most"

# Resolve
export PATH=$PATH:/opt/resolve/bin

export EDITOR="nvim"

# Create config alias for git versioning of .config folder
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
config config status.showUntrackedFiles no

# Change default mapping for , and . to reproduce < and >
#xmodmap ~/.Xmodmap

# pywal
#setsid wal -i ~/Immagini/city_skyline.jpg

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Setting keyboard layout
setxkbmap it

###-tns-completion-start-###
if [ -f /home/giacomo/.tnsrc ]; then
    source /home/giacomo/.tnsrc
fi
###-tns-completion-end-###

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
