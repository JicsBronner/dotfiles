# Defined in - @ line 1
function execute --description "create /etc/factoryreset/execute file on device"
    set devico "device"
    if [ $argv = "macanpro" ]
        set devico "device1"
    end
    sshpass -p "" ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $devico "/bin/touch /etc/factoryreset/execute"
end
