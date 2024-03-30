# Defined in - @ line 1
function checkjs --wraps='HOME=/home/jebro/validator yarn --cwd /home/jebro/validator --mutex file validate --source=/home/jebro/uimodels/' --description 'alias checkjs=HOME=/home/jebro/validator yarn --cwd /home/jebro/validator --mutex file validate --source=/home/jebro/uimodels/'
  HOME=/home/jebro/validator yarn --cwd /home/jebro/validator --mutex file validate --source=/home/jebro/uimodels/ $argv;
end
