# Defined in - @ line 1
function cdd --wraps='cd /home/jebro/dev/' --wraps='cd /home/jebro/Documents/dev/' --description 'alias cdd=cd /home/jebro/Documents/dev/'
  cd /home/jebro/Documents/dev/ $argv;
end
