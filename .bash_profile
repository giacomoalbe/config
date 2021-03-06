#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

if [ "$(uname)" == "Darwin" ];
then
  export PATH="/usr/local/opt/node@10/bin:$PATH"
  export PATH="/Users/giacomo.alberini/Library/Python/3.7/bin:$PATH"
  export PATH="/Users/giacomo.alberini/Documents/flutter/bin:$PATH"
fi
