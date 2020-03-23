#! /usr/local/bin/bash

echo "~~~~~Let's play SNAKE and LADDER~~~~~"

#Constants
STARTING_POSITION=0
WINNING_POSITION=100
NO_PLAY=1
LADDER=2
SNAKE=3

#variables
rollCount=0
player=1
currentPositionPlayer1=$STARTING_POSITION
currentPositionPlayer2=$STARTING_POSITION

function showCurrentPosition(){

echo "current positions--> player1:$currentPositionPlayer1 player2:$currentPositionPlayer2"

}


function rollDice(){

dice=$((RANDOM%6+1))
moveOption=$(( RANDOM%3+1 ))

}


while [[ $currentPositionPlayer1 -ne $WINNING_POSITION && $currentPositionPlayer2 -ne $WINNING_POSITION ]]
do
		showCurrentPosition
		rollDice
		(( rollCount++ ))

		if [[ $player -eq 1 ]]
		then
				tempPositionHolder=$currentPositionPlayer1
		else
				tempPositionHolder=$currentPositionPlayer2
		fi
		case $moveOption in
				$NO_PLAY)
						echo "player$player stays at same position $tempPositionHolder";;

				$LADDER)
						if [[ $(( $"$tempPositionHolder" + $dice )) -le $WINNING_POSITION ]]
						then
								tempPositionHolder=$(( $"$tempPositionHolder"+$dice ))
								echo "player$player moves forward by $dice positions"
						else
								echo "player$player stays at same position since $tempPositionHolder+$dice exceeds winning position."
						fi
						;;

				$SNAKE)
						if [[ $(( $"$tempPositionHolder" - $dice )) -lt $STARTING_POSITION ]]

						then
								tempPositionHolder=0
								echo "player$player has came back to the starting position"
						else
								tempPositionHolder=$(( $"$tempPositionHolder" - $dice ))
								echo "player$player moves backward by $dice positions"
						fi
						;;
		esac

		if [[ $player -eq 1 ]]
		then
				currentPositionPlayer1=$tempPositionHolder
		else
				currentPositionPlayer2=$tempPositionHolder
		fi
		player=$(( 3 - $player  ))

done

if [[ $currentPositionPlayer1 -eq $WINNING_POSITION ]]
then
		echo "player1 won!"
else
		echo "player2 won!"
fi
echo "turns required: $rollCount"