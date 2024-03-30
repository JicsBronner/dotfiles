# Defined in - @ line 1
function bmfs --description 'alias bmfs sshfs bm:/home/jebro/shdir /home/jebro/shdir'
	sshfs bm:/home/jebro/shdir /home/jebro/shdir $argv;
end
