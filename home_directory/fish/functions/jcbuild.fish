# Defined in - @ line 1
function jcbuild --description 'alias jcbuild cd /home/jebro/git-repo/unity_core_and_package/unity-packages/build/ && make -C '
	cd /home/jebro/git-repo/unity_core_and_package/unity-packages/build/ && make -C  $argv; cd -;
end
