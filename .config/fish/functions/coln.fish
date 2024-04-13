function coln --description "Function for printing a column (splits input on whitespace)"
    while read -l input
	echo $input | awk '{print $'$argv'}'
    end
end
