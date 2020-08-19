##!/bin/bash -x
STAKE=100
BET=1
MAX_DAYS=30
noOfWins=0
noOfLoss=0
winning_days=0
loosing_days=0
STAKE_PERCENTAGE=$((((STAKE*50))/100))
dailyStake=$STAKE
betCalculation(){
	STAKE=100
	dailyStake=$STAKE
	STAKE_PERCENTAGE=$((((STAKE*50))/100))
	while [ $STAKE -gt $((dailyStake-STAKE_PERCENTAGE)) ] && [ $STAKE -lt $((dailyStake+STAKE_PERCENTAGE)) ]
	do
		result=$((RANDOM%2))

		if [ $result -eq 1 ]
		then
			STAKE=$((STAKE + BET))
			(( noOfWins++ ))
		else
			STAKE=$((STAKE - BET))
			(( noOfLoss++ ))
		fi
	done
	if [ $noOfWins -gt $noOfLoss ]
	then
		((winning_days++))
	else
		((loosing_days++))
	fi
}
amountCalculation(){
	if [ $winning_days -gt $loosing_days ]
	then
		winning_amt=$((winning_days*STAKE_PERCENTAGE))
		echo "The gambler won by $winning_days days and the winning amount is: $winning_amt"
	else
		loosing_amt=$((loosing_days*STAKE_PERCENTAGE))
		echo "The gambler loose by $loosing_days days  and the loosing amount is: $loosing_amt"
	fi
}
for (( i=0;  i<MAX_DAYS; i++ ))
do
betCalculation
done
amountCalculation

