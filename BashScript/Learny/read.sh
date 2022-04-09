#!/bin/bash

echo "I am a super computer"
echo "I can caculate you height just by one number you give me"
echo "Now, let the amazement begin"

echo -n "First, enter your height: "
read height

echo "Your height is $height"

echo -n "Enter you height: "

read height2

if [ $height -eq  $height2 ];
then echo "It is the second time you enter $height, and your height will not be change even doing so"
fi

# $() or ` ` to  run command. EX: `expr 1 + 1` -> 2

# {a..b} equals {a,a+1,a+2,...,b-1,b}

# short of if: [ condition ] && <do somethings>. EX [ 1 -eq 1 ] && break

function chao() {
	echo "chao em"
	echo "anh dung day tu chieu"
}

chao

# readonly means const variable

var1="day la var"
var2="var1"

echo ${!var2}

# :!bash tenfile to run file derectly 
