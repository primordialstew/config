export CFG=$HOME/cfg

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/work/jessup-tools/normalize-pgdump" ] ; then
    PATH="$PATH:$HOME/work/jessup-tools/normalize-pgdump"
fi

source ~/.bash_prompt
source ~/.bashrc
