# Defined in - @ line 1
function rebootd --description "reboot device"
    set devico "device"
    if [ $argv = "macanpro" ]
        set devico "device1"
    end
    sshpass -p "" ssh -o "StrictHostKeyChecking=no" $devico "/sbin/ngc -6"
end
