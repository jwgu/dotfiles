#-----------------------------------
# Source global definitions (if any)
#-----------------------------------

if [ -f /etc/bashrc ]; then
        . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

#------------- GIT related -------------

# Get git-completion script from 
# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.basho#

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

git_branch() {
    git branch 2>/dev/null | grep '^*' | colrm 1 2
}

export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w \[\033[0;32m\]($(git_branch))\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\]\[\033[0m\] '

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

alias du='du -kh'
alias df='df -kTh'

alias q='exit'
alias c='clear'
alias h='history'

alias ls='ls -G'
alias ll='ls -lG'


#export PATH=$PATH:~/.../


