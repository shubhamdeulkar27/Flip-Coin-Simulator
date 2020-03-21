#!/bin/bash -x

IS_HEAD=0
IS_TAIL=1
COUNT=10

headCount=0
tailCount=0

#FUNCTION FOR FLIPPING COIN
function flipCoin(){
	result=$(( RANDOM%2 ))
	echo $result
}

#FLIPING COIN AND STORING IT IN DICTIONARY
declare -A singlet
for ((  i=0 ; i<COUNT ; i++ ))
do
	singlet[$i]=$( flipCoin )
	if (( singlet[$i]==IS_HEAD ))
	then
		(( headCount++ ))
	elif (( singlet[$i]==IS_TAIL ))
	then
		(( tailCount++ ))
	fi
done
echo ${singlet[@]}

#FUNCTION FOR CALCULATING PERCENTAGE
function percentage(){
	count=`echo "$1*0.1"|bc`
	percent=`echo "$count*100"|bc`
	echo $percent
}

singletHeadPercentage=$( percentage $headCount )
echo $singletHeadPercentage
singletTailPercentage=$( percentage $tailCount )
echo $singletTailPercentage
