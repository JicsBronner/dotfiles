# Defined in - @ line 1
function jenkinssh --description 'alias jenkinssh=ssh -i .ssh/jenkinstunnel@AirLinkOSBridge -L8443:localhost:8443  -N jenkinstunnel@13.36.106.198'
	ssh -i .ssh/jenkinstunnel@AirLinkOSBridge -L8443:localhost:8443  -N jenkinstunnel@13.36.106.198 $argv;
end
