# Defined in - @ line 1
function vif --description 'alias vif=nvim -o (fzf)'
	nvim -o (fzf) $argv;
end
