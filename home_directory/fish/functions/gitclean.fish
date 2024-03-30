# Defined in - @ line 1
function gitclean --wraps='cd /home/jebro/git-repo/unity-packages/ && git checkout apps/vehicle/ libs/netfwk/ telemetry/ && cd -' --description 'alias gitclean=cd /home/jebro/git-repo/unity-packages/ && git checkout apps/vehicle/ libs/netfwk/ telemetry/ && cd -'
  cd /home/jebro/git-repo/unity-packages/ && git checkout apps/vehicle/ libs/netfwk/ telemetry/ && cd - $argv;
end
