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



while [[ $headsCount -le 21 && $tailsCount -le 21 ]]
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
	echo "Its a tie"
else
	max $tailsCount $headsCount
	if [ $? -eq $tailsCount ]
	then
		echo "winner is tails"
	else
		echo "winner is heads"
	fi
fi

