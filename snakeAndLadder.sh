#! /usr/local/bin/bash

echo "~~~~~Let's play Snake and Ladder~~~~~"

currentPosition=0

function showCurrentPosition(){

echo "current position is: $currentPosition"

}

function rollDice(){

dice=$((RANDOM%6+1))

}

showCurrentPosition
rollDice
