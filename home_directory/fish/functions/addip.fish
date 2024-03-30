# Defined in - @ line 1
function addip --wraps='sudo ip a add 192.168.3.105/24 dev enp5s0' --description 'alias addip=sudo ip a add 192.168.3.105/24 dev enp5s0'
  sudo ip a add 192.168.3.105/24 dev enp5s0 $argv;
end
