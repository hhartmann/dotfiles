# Aliase
alias copy="cp -i"
alias move="mv -i"

# Bash
PS1="\u \w * "

# Read man pages in preview
psman()
{
man -t "${1}" | open -f -a /Applications/Preview.app/
}

export PATH="$PATH:~/bin"


if [ -r ~/.bashrc ] ; then
   source ~/.bashrc
fi

