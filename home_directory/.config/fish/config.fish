
set -gx MANPATH /usr/local/man:/usr/local/share/man:/usr/share/man:/usr/man
set -gx PATH /home/jebro/jcutil/bin /home/jebro/.nvm/versions/node/v10.15.3/bin /home/jebro/git-repo/unity/build/tmp/sysroots/x86_64/usr/bin/arm-poky-linux-gnueabi $PATH

xrandr --output DP-2-1 --auto --left-of eDP-1
xrandr --output DP-2-1 --auto --left-of eDP-1
xrandr --output HDMI-1 --auto --left-of DP-2-1

function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end
