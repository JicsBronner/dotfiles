# Defined in - @ line 1
function vig --wraps='vi (grep -rlE  *)' --description 'alias vig=vi (grep -rl <pattern> *)'
  if test (count $argv) -lt 2
    echo "1111"
    vi (grep -rlE $argv[1] *);
  else
    echo "2222"
    vi (grep -rlE $argv[1] $argv[2]);
  end
end
