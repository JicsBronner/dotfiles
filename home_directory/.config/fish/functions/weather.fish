function weather
  set nargs (count $argv)
if test $nargs -gt 0
  echo $argv
curl wttr.in/$argv[1]
else
curl wttr.in/Toulouse
end
end
