#!/bin/bash -x

COUNT=10

#FUNCTION FOR FLIPPING COIN
function flipCoin(){
	result=$(( RANDOM%2 ))
	echo $result
}

#FUNCTION FOR CALCULATING PERCENTAGE
function percentage(){
   count=`echo "$1*0.1"|bc`
   percent=`echo "$count*100"|bc`
   echo $percent
}

#GENERATING SINGLET AND STORING IN DICTIONARY

IS_HEAD=0
IS_TAIL=1

headCount=0
tailCount=0


declare -A singlet
counter=0
for ((  i=0 ; i<COUNT ; i++ ))
do
	singlet[$counter]=$( flipCoin )
	if (( singlet[$counter]==IS_HEAD ))
	then
		(( headCount++ ))
	elif (( singlet[$counter]==IS_TAIL ))
	then
		(( tailCount++ ))
	fi
	(( counter++ ))
done

#SINGLET PERCENTTAGE
singlet[ $(( counter++ )) ]=$( percentage $headCount )
echo $singletHeadPercentage
singlet[ $(( counter++ )) ]=$( percentage $tailCount )
echo $singletTailPercentage

echo ${singlet[@]}

#GENERATING DOUBLET AND STORING IN DICITIONARY

IS_HEAD_HEAD="00"
IS_HEAD_TAIL="01"
IS_TAIL_HEAD="10"
IS_TAIL_TAIL="11"

headHeadCount=0
headTailCount=0
tailHeadCount=0
tailTailCount=0

declare -A doublet
counter=0
for (( i=0 ; i<COUNT ; i++ ))
do
		doublet[$counter]=$( flipCoin )$( flipCoin )
	if (( doublet[$counter]==$IS_HEAD_HEAD ))
	then
		(( headHeadCount++ ))
	elif (( doublet[$counter]==$IS_HEAD_TAIL ))
	then
		(( headTailCount++ ))
	elif (( doublet[$counter]==$IS_TAIL_HEAD ))
	then
		(( tailHeadCount++ ))
	elif (( doublet[$counter]==$IS_TAIL_TAIL ))
	then
      (( tailTailCount++ ))
	fi
	(( counter++ ))
done

printf " -----------------\n"
doublet[ $(( counter++ ))]=$( percentage $headHeadCount )
doublet[ $(( counter++ ))]=$( percentage $headTailCount )
doublet[ $(( counter++ ))]=$( percentage $tailHeadCount )
doublet[ $(( counter++ ))]=$( percentage $tailTailCount )

echo ${doublet[@]}

