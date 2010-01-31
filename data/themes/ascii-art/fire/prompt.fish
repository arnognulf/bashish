function fish_prompt
        echo C:
	echo $PWD|tr a-z A-Z|sed 's/\//\\/g'
	echo '>'
end
