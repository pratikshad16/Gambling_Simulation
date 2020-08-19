#!/bin/bash -x
STAKE=100
BET=1
result=$(( RANDOM%2 ))
if [ $result -eq 1 ]
then
	STAKE=$((STAKE+BET))
else
	STAKE=$((STAKE-BET))
fi 
