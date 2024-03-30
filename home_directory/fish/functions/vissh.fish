# Defined in - @ line 1
function vissh --description 'alias vissh vim scp://root@192.168.1.1/'
	vi scp://root@192.168.1.1/$argv;
end
