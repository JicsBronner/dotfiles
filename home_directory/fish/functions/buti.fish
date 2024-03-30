# Defined in - @ line 1
function buti --description 'alias buti=bash -c "cd /home/jebro/git-repo/unity/ && source meta-unity-distro/unity-init-build-env && time bitbake unity-image -c testimage"'
	bash -c "cd /home/jebro/git-repo/github-unity/unity/ && source meta-unity-distro/unity-init-build-env && time bitbake unity-image -c testimage" $argv;
end
