
set -gx MANPATH /usr/local/man:/usr/local/share/man:/usr/share/man:/usr/man
set -gx PATH /home/jebro/.nvm/versions/node/v16.14.2/bin/ /home/jebro/jcutil/bin /home/jebro/git-repo/unity/build2/tmp/sysroots/x86_64/usr/bin/arm-poky-linux-gnueabi /home/jebro/git-repo/unity/build2/tmp/sysroots/x86_64/usr/bin/aarch64-poky-linux /home/jebro/.local/bin $PATH
set -gx FZF_DEFAULT_COMMAND 'fdfind --type f --hidden --follow --exclude .git'
set -gx EDITOR /usr/bin/nvim

alias vimdiff="nvim -d"

# xrandr --output DP-2-1 --auto --left-of eDP-1
# xrandr --output DP-2-1 --auto --left-of eDP-1
# xrandr --output HDMI-1 --auto --left-of DP-2-1

function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

function nvm
   bass source $HOME/.nvm/nvm.sh --no-use ';' nvm $argv
end
