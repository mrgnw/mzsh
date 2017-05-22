alias py=python3
alias python=python3

alias py2=python2.7

# virtualenv / virtualenvwrapper
mkvenv() { mkvirtualenv --python=/usr/local/bin/python3 $* }
rmvenv() { rmvirtualenv $* }
cdvenv() { cdvirtualenv $* }
lsvenv() { lsvirtualenv $* }
showvenv() { showvirtualenv $* }


export WORKON_HOME=~/.virtualenvs
# Todo: Check if it's there, prompt to install if it's not
# source /usr/local/bin/virtualenvwrapper.sh

export PATH=/usr/local/lib/python2.7/site-packages:$PATH
