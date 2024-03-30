# Defined in - @ line 1
function opkg-setup --description "opkg setup devices"
  scp ~/Documents/opkg-server/base-feeds.conf_$argv device:/etc/opkg/base-feeds.conf
  cd /home/jebro/git-repo/unity/build/tmp/deploy/ipk && python -m SimpleHTTPServer
end
