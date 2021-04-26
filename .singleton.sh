pgrep $1
if [ $? -ne 0 ]
then
    $1
fi
