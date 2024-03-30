# Defined in - @ line 1
function gb --description 'alias gb=git branch --sort=committerdate'
	git branch --sort=committerdate $argv;
end
