# Defined in - @ line 1
function addroute --wraps='sudo ip r add default via 192.168.3.1 dev enp5s0 metric 100000' --description 'alias addroute=sudo ip r add default via 192.168.3.1 dev enp5s0 metric 100000'
  sudo ip r add default via 192.168.3.1 dev enp5s0 metric 100000 $argv;
end
