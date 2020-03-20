#!/bin/bash -x

IS_HEAD=0
IS_TAIL=1

function flipCoin(){
	result=$(( RANDOM%2 ))
	echo $result
}

result=$( flipCoin )
