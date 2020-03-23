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

#CALCULATING DOUBLET PERCENTAGE
doublet[ $(( counter++ ))]=$( percentage $headHeadCount )
doublet[ $(( counter++ ))]=$( percentage $headTailCount )
doublet[ $(( counter++ ))]=$( percentage $tailHeadCount )
doublet[ $(( counter++ ))]=$( percentage $tailTailCount )
echo ${doublet[@]}

#GENERATING TRIPLET AND STRING IN DICTIONARY

IS_HEAD_HEAD_HEAD="000"
IS_HEAD_HEAD_TAIL="001"
IS_HEAD_TAIL_HEAD="010"
IS_TAIL_HEAD_HEAD="100"
IS_HEAD_TAIL_TAIL="011"
IS_TAIL_HEAD_TAIL="101"
IS_TAIL_TAIL_HEAD="110"
IS_TAIL_TAIL_TAIL="111"

headHeadHeadCount=0
headHeadTailCount=0
headTailHeadCount=0
tailHeadHeadCount=0
headTailTailCount=0
tailHeadTailCount=0
tailTailHeadCount=0
tailTailTailCount=0

declare -A triplet
counter=0

for (( i=0 ; i<COUNT ; i++ ))
do
	triplet[$counter]=$( flipCoin )$( flipCoin )$( flipCoin )
	if (( triplet[$counter]==$IS_HEAD_HEAD_HEAD ))
	then
		(( headHeadHeadCount++ ))
	elif (( triplet[$counter]==$IS_HEAD_HEAD_TAIL ))
	then
		(( headHeadtailCount++ ))
	elif (( triplet[$counter]==$IS_HEAD_TAIL_HEAD ))
	then
		(( headTailHeadCount++ ))
	elif (( triplet[$counter]==$IS_TAIL_HEAD_HEAD ))
	then
		(( tailHeadHeadCount++ ))
	elif (( triplet[$counter]==$IS_HEAD_TAIL_TAIL ))
	then
		(( headTailTailCount++ ))
	elif (( triplet[$counter]==$IS_TAIL_HEAD_TAIL ))
	then
		(( tailHeadTailCount++ ))
	elif (( triplet[$counter]==$IS_TAIL_TAIL_HEAD ))
	then
		(( tailTailHeadCount++ ))
	elif (( triplet[$counter]==$IS_TAIL_TAIL_TAIL ))
	then
		(( tailTailTailCount++ ))
	fi
	(( counter++ ))
done

#CALCULATING PERCENTAGE
triplet[ $(( counter++ )) ]=$( percentage $headHeadHeadCount )
triplet[ $(( counter++ )) ]=$( percentage $headHeadTailCount )
triplet[ $(( counter++ )) ]=$( percentage $headTailHeadCount )
triplet[ $(( counter++ )) ]=$( percentage $tailHeadHeadCount )
triplet[ $(( counter++ )) ]=$( percentage $headTailTailCount )
triplet[ $(( counter++ )) ]=$( percentage $tailHeadTailCount )
triplet[ $(( counter++ )) ]=$( percentage $tailTailHeadCount )
triplet[ $(( counter++ )) ]=$( percentage $tailTailTailCount )
echo ${triplet[@]}


