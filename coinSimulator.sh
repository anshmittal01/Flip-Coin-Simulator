#! /bin/bash

isHead=0
isTail=1
flips=10

headsCount=0
tailsCount=0

flipCoin () {
	echo "$(( RANDOM%2 ))"
}

max () {
        if [ $1 -gt $2 ]
        then
                return $1
        else
                return $2
        fi
}

absoluteDiff () {
    local diff
    diff=$(($1 - $2));
    if [ $diff -lt 0 ]
    then
        diff=$((-$diff))
    fi
    echo $diff
}

while [[ $headsCount -le 21 || $tailsCount -le 21 ]]
do
	outcome=`flipCoin`
	if [ $outcome -eq $isTail ]
	then
		(( tailsCount++ ))
	else
		(( headsCount++ ))
	fi
done

echo "head count is "$headsCount
echo "tail count is "$tailsCount

if [ $headsCount -eq $tailsCount ]
then
	diff=`absoluteDiff $headsCount $tailsCount`
	while [ $diff -lt 2 ]
	do
		outcome=`flipCoin`
		if [ $outcome -eq $isTail ]
		then
			(( tailsCount++ ))
		else
			(( headsCount++ ))
		fi
		diff=`absoluteDiff $headsCount $tailsCount`
	done
	echo "head count is "$headsCount
	echo "tail count is "$tailsCount

fi
max $tailsCount $headsCount
if [ $? -eq $tailsCount ]
then
	echo "winner is tails"
else
	echo "winner is heads"
fi
