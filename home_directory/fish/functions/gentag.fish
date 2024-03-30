# Defined in - @ line 1
function gentag --wraps='ctags -R --exclude="oe*" unity-core/ unity-packages/' --description 'alias gentag=ctags -R --exclude="oe*" unity-core/ unity-packages/'
  ctags -R --exclude="oe*" unity-core/ unity-packages/ $argv;
end
