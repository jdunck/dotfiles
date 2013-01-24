export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export PS1='\h:\W \u\$ '
PATH=$PATH:$HOME/bin
export PATH
export TERM=xterm-256color

# functions
function manp { man -t "${1}" | open -f -a Preview; }

if [[ -f '/usr/local/bin/brew' ]]; then
   for dir in `brew --prefix`/etc/bash_completion.d/*; do
      . $dir 
   done
fi
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=/usr/local/sbin:/usr/local/bin:$PATH
PATH=/Users/jdunck/bin:/Users/jdunck/votizen/code/git-hooks/:$PATH

# erase duplicate lines from the history; ignore lines that begin with a space
HISTCONTROL=erasedups:ignorespace

# extend the history (default 500)
HISTSIZE=100000
HISTFILESIZE=100000

# append to history rather than overwriting
shopt -s histappend

# don't try to complete on nothing
shopt -s no_empty_cmd_completion

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

[[ -s "/Users/jdunck/.rvm/scripts/rvm" ]] && source "/Users/jdunck/.rvm/scripts/rvm"

[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source "/usr/local/bin/virtualenvwrapper.sh"

alias vt='./manage.py test --traverse-namespace  --with-progressive -s'
alias localproxy='ssh -NR20020:127.0.0.1:8000 dunck.us'

NOSE_PROGRESSIVE_EDITOR='subl'

log(){ date >> ~/Dropbox/log/$* ; cat >> ~/Dropbox/log/$* ; }

