# Defined in - @ line 1
function jcwifi --description "install wifi odyssey"
        if [ $argv = "mack" ]
            cd ~/git-repo/unity-packages/build/ && make -j 20 -C apps/net/wifimgr/; cd -
	    sshpass -p "" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no ~/dev-ipk/libcap-bin_2.63-r0_aarch64.ipk device:/home/root;
            sshpass -p "" ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no device '/sbin/ngc --stop net/wifimgr';
            sshpass -p "" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no ~/git-repo/unity-packages/build/apps/net/wifimgr/wifimgr device:/usr/sbin/wifimgr
        else if [ $argv = "lexus-large" ]
            cd ~/git-repo/unity-packages/build-lexus/ && make -j 20 -C apps/net/wifimgr/; cd -
	    sshpass -p "" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no ~/dev-ipk/libcap-bin_2.63-r0_aarch64.ipk device:/home/root;
            sshpass -p "" ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no device '/sbin/ngc --stop net/wifimgr';
            sshpass -p "" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no ~/git-repo/unity-packages/build-lexus/apps/net/wifimgr/wifimgr device:/usr/sbin/wifimgr
        else
            cd ~/git-repo/unity-packages/build-odyssey/ && make -j 20 -C apps/net/wifimgr/; cd -
	    sshpass -p "" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no ~/dev-ipk/libcap-bin_2.63-r0_cortexa9t2hf-neon.ipk device:/home/root;
            sshpass -p "" ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no device '/sbin/ngc --stop net/wifimgr';
            sshpass -p "" scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no ~/git-repo/unity-packages/build-odyssey/apps/net/wifimgr/wifimgr device:/usr/sbin/wifimgr
        end

        set command '/usr/bin/opkg install --force-reinstall /home/root/libcap-bin_*.ipk && /usr/sbin/setcap cap_net_admin,cap_net_raw=eip /usr/sbin/wifimgr && /sbin/ngc --start net/wifimgr'
        sshpass -p "" ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no device $command
end
