# Defined in - @ line 1
function flashdevice --description alias\ flashdevice=scp\ \ device:/tmp/\;ssh\ device\ \'swpreinstaller\ -f\ /tmp/\'
	scp $argv device:/home/root/;ssh device 'cd /home/root/ && swpreinstaller -f $argv';
end
