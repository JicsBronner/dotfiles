# Defined in - @ line 1
function sshkg --description 'alias sshkg ssh-keygen -f "/home/jebro/.ssh/known_hosts" -R "192.168.1.1" && ssh device'
	ssh-keygen -f "/home/jebro/.ssh/known_hosts" -R "192.168.1.1" && ssh device $argv;
end
