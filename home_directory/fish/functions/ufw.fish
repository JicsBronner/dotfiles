# Defined in - @ line 1
function ufw --description "install ufw to tmp"
	cp /home/jebro/git-repo/unity/build/tmp/deploy/images/$argv/unity-image-*.notset.ufw /tmp/;
end
