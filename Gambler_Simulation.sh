##!/bin/bash -x
STAKE=100
BET=1
MAX_DAYS=30
winning_days=0
loosing_days=0
count=0
declare -A luckyArray
declare -A unluckyArray
STAKE_PERCENTAGE=$((((STAKE*50))/100))
dailyStake=$STAKE
betCalculation(){
	STAKE=100
	noOfWins=0
	noOfloss=0
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
	if [ $STAKE -gt $dailyStake ]
	then
		luckyArray[$count]=$noOfWins
		unluckyArray[$count]=$noOfLoss
		((count++))
		((winning_days++))
	else
		 luckyArray[$count]=$noOfWins
                unluckyArray[$count]=$noOfLoss
                ((count++))
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
luckyDayFinder(){
lucky=${luckyArray[1]}
for i in ${luckyArray[@]}
do
     if [[ $i -gt $lucky ]]
     then
        lucky="$i"
     fi
done
for i in ${luckyArray[@]}
do
        ((countj++))
        if [[ $i -eq $lucky ]]
        then

                echo "the  lucky day was $countj with win of about $lucky times"
        fi
done
unlucky=${unluckyArray[1]}
for i in ${unluckyArray[@]}
do
     if [[ $i -gt $unlucky ]]
     then
        unlucky="$i"
     fi
done
for i in ${unluckyArray[@]}
do
	((countk++))
	if [[ $i -eq $unlucky ]]
	then

		echo "the unlucky day was $countk with loss for about $unlucky times"
	fi
done
}
for (( i=0;  i<MAX_DAYS; i++ ))
do
betCalculation
done
amountCalculation
luckyDayFinder

