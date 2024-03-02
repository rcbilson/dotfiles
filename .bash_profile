export PATH=~/go/bin:$PATH
export PS1='\w\n\$ '
if which vim >/dev/null
then
        export EDITOR=`which vim`
else
        export EDITOR=/bin/vi
fi        
export VISUAL=$EDITOR
. ~/.bashrc
