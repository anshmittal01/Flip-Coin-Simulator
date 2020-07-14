#! /bin/bash

isHead=0
isTail=1
flips=10

headsCount=0
tailsCount=0

flipCoin () {
	echo "$(( RANDOM%2 ))"
}

for(( count=1;count<=$flips;count++))
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
