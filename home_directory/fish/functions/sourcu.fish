# Defined in - @ line 1
function sourcu --wraps='cd ~/git-repo/unity/ && bax source meta-unity-distro/unity-init-build-env' --description 'alias sourcu=cd ~/git-repo/unity/ && bax source meta-unity-distro/unity-init-build-env'
  cd ~/git-repo/unity/ && bax source meta-unity-distro/unity-init-build-env $argv;
end
