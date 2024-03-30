# Defined in - @ line 1
function jctags --wraps='cd ~/git-repo/ && ctags -R unity-packages/apps/ unity-packages/libs/ unity-core/libs/' --wraps='cd ~/git-repo/ && ctags -R unity-packages/apps/ unity-packages/libs/ unity-core/libs/ && cd -' --description 'alias jctags=cd ~/git-repo/ && ctags -R unity-packages/apps/ unity-packages/libs/ unity-core/libs/ && cd -'
  cd ~/git-repo/ && ctags -R unity-packages/apps/ unity-packages/libs/ unity-core/libs/ && cd - $argv;
end
