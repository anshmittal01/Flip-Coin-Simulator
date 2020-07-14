#! /bin/bash

isHead=0
isTail=1

flipCoin () {
	echo "$(( RANDOM%2 ))"
}

outcome=`flipCoin`
if [ $outcome -eq $isTail ]
then
	echo "TAILS"
else
	echo "HEADS"
fi
