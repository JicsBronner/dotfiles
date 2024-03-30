# Defined in - @ line 1
function tmb --description 'alias tmb=cd ~/git-repo/busybox/ && make install && gdb ./sh'
	cd ~/git-repo/busybox/ && make install && gdb ./sh $argv;
end
