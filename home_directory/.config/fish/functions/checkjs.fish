# Defined in - @ line 1
function checkjs --description 'alias checkjs cd /home/jebro/validator/ && ./command.sh '
	cd /home/jebro/validator/ && ./command.sh  $argv;
        cd -;
end
