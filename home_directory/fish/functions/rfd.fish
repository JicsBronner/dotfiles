# Defined in - @ line 1
function rfd --description "rfd device"
    set devico "device"
    if [ $argv = "macanpro" ]
        set devico "device1"
    end
    sshpass -p "" ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $devico "touch /etc/factoryreset/execute && /sbin/ngc -6"
end
