# Defined in /home/jebro/.config/fish/functions/tmuxbm.fish @ line 2
function tmuxbm --description 'alias tmuxbm=ssh bm -t tmux attach -t remote_session'
	ssh bm -t tmux attach -t remote_session $argv;
end
