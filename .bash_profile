#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
