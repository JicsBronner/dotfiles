# Defined in - @ line 1
function killminicom --wraps=ps\ aux\ \|\ grep\ -i\ minicom\ \|\ awk\ \'\{print\ \}\'\ \|\ xargs\ sudo\ kill\ -9 --description alias\ killminicom=ps\ aux\ \|\ grep\ -i\ minicom\ \|\ awk\ \'\{print\ \}\'\ \|\ xargs\ sudo\ kill\ -9
  ps aux | grep -i minicom | awk '{print }' | xargs sudo kill -9 $argv;
end
