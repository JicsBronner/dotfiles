# Defined in - @ line 1
function wifidebug --description "wifidebug fish"
    set devico "device"
    sshpass -p "" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no /home/jebro/dev-ipk/wpa-supplicant-cli_2.9-r0_armv7at2hf-neon.ipk /home/jebro/dev-ipk/iw_5.4-r0_armv7at2hf-neon.ipk /home/jebro/dev-ipk/libcap-bin_2.32-r0_armv7at2hf-neon.ipk $devico:/home/root
    sshpass -p "" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no /home/jebro/dev-ipk/any $devico:/etc/initng/net/wpasupplicant/any
    sshpass -p "" ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no $devico "opkg install --force-reinstall /home/root/wpa-supplicant-cli_2.9-r0_armv7at2hf-neon.ipk /home/root/libcap-bin_2.32-r0_armv7at2hf-neon.ipk /home/root/iw_5.4-r0_armv7at2hf-neon.ipk"
end
