function findo
	find . -iname "*$argv*" -not -path "./build/*"
end
