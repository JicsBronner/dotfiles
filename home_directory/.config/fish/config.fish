
# ALIASES
alias vi='/usr/bin/vim'
alias ssh_vps='ssh jc@51.75.161.140 -p 456'
alias unset 'set --erase'

# VARIABLES
export ip_vps="51.75.161.140"
export PATH="$PATH:~/Documents/applications/tuxguitar/"
export EDITOR="/usr/bin/vi"
export GTAGSLABEL=pygments

# FUNCTIONS 
function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

