# if the cmd pgrep doesnt find the process php-fpm and returns an error code
# silence the error and store nothing in the variable test
pgrep mysql 2> /dev/null > test
# [ -s test ] checks if test is empty or not
# if $? = 0 then the file is not empty
# (> test) empties the file
# "return" crashes the container
[ -s test ]
if [ $? != 0 ]; then
		> test
		return
else
	echo "ok"
fi
