# Defined in - @ line 1
function bui --description 'alias bui=bash -c "cd /home/jebro/git-repo/unity/ && source meta-unity-distro/unity-init-build-env && time bitbake unity-image"'
	bash -c "cd /home/jebro/git-repo/unity/ && source meta-unity-distro/unity-init-build-env && time bitbake unity-image" $argv;
end
