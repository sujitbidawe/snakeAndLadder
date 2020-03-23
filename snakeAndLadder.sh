#! /usr/local/bin/bash

echo "~~~~~Let's play Snake and Ladder~~~~~"

startingPosition=0
currentPosition=0
winningPosition=100

function showCurrentPosition(){

echo "current position is: $currentPosition"

}

function rollDice(){

dice=$((RANDOM%6+1))
moveOption=$(( RANDOM%3+1 ))

}
showCurrentPosition
rollDice


noPlay=1
ladder=2
snake=3

case $moveOption in
		$noPlay)
				echo "player stays at same position $currentPosition";;

		$ladder)
				if [[ $(( $currentPosition + $dice )) -le $winningPosition ]]
				then
						currentPosition=$(( $currentPosition + $dice ))
						echo "player moves forward by $dice positions and is now at $currentPosition"
				else
						echo "player stays at same position since $currentPosition+$dice exceeds winning position."
				fi
				;;

		$snake)
				if [[ $(($currentPosition - $dice)) -lt $startingPosition ]]
				then
						currentPosition=0
						echo "player has came back to the starting position $currentPosition"
				else
						currentPosition=$(( $currentPosition - $dice ))
						echo "player moves backward by $dice positions and is now at $currentPosition"
				fi
				;;
esac

