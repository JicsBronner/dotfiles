# Defined in - @ line 1
function install --description "install ufw"
    set devico "device"
    if [ $argv = "macanpro" ]
        set devico "device1"
    end
    set varver (ls -lt /tmp/*.ufw | head -n 1 | awk '{ print $9 }')
    sshpass -p "" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $varver $devico:/tmp
    sshpass -p "" ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $devico "swpreinstaller -f $varver"
end
