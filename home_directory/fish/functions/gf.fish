# Defined in - @ line 1
function gf --wraps='git add -u && git commit --amend --no-edit && git push -f' --description 'alias gf=git add -u && git commit --amend --no-edit && git push -f'
  git add -u && git commit --amend --no-edit && git push -f $argv;
end
