# Defined in - @ line 1
function killbitbake --wraps=ps\ aux\ \|\ grep\ -i\ bitbake\ \|\ awk\ \'\{print\ \}\'\ \|\ xargs\ sudo\ kill\ -9 --description alias\ killbitbake=ps\ aux\ \|\ grep\ -i\ bitbake\ \|\ awk\ \'\{print\ \}\'\ \|\ xargs\ sudo\ kill\ -9
  ps aux | grep -i bitbake | awk '{print }' | xargs sudo kill -9;
end
