#!/bin/bash -x
STAKE=100
BET=1
high=$(( $STAKE + $(( ($STAKE*50)/100)) ));
low=$((  $STAKE - $(( ($STAKE*50)/100)) ));
while [ $STAKE -gt $low ] && [ $STAKE -lt $high ]
do
	result=$((RANDOM%2))

	if [ $result -eq 1 ]
	then
		STAKE=$((STAKE + BET))
	else
		STAKE=$((STAKE - BET))
	fi
done
echo "you have done with  today's bets" 
