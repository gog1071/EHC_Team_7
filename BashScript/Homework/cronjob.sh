#!/bin/bash

clear

path=$1

time=$(grep '^time_' $path/.log | tail -1 )
time=${time:5}
if [ "$((time+1))" == 1 ]
then 
	echo "" >  $path/.log.txt
fi
echo "time_"$((time+1)) 
count=0
while read line; 
do
	last[$count]=$line
	check[$count]=0
	((count++))
done < $path/.log.txt  
ls -l $path > $path/.logtmp.txt
count2=0
while read line;
do
	now[$count2]=$line
	check2[$count2]=0
	((count2++))
done < $path/.logtmp.txt

for ((i=1; i<count; i++))
do
	tmp=${last[$i]}
	if ((check[i] == 1 )) 
	then continue 
	fi
	for ((j=1; j<count2;j++))
	do
		if (( check2[j] == 1))
		then continue
		fi
		if [ "$tmp" == "${now[j]}" ] 
		then 
		
			((check[i]=1))
			((check2[j]=1))
			break			
		else
			namelast=$(echo $tmp | grep -Eo '[^[:blank:]]+' | tail -1 ) 
			namenow=$(echo ${now[j]} | grep -Eo '[^[:blank:]]+' | tail -1)
			if [ "$namelast" == "$namenow" ]
			then
				echo $namelast ":alter" 
				((check[i]=1))
				((check2[j]=1))
				break
			fi
		fi
			
	done
done

for ((i=1;i<count;i++))
do
	if ((check[i] == 0))
	then
		echo $(echo ${last[i]} | grep -Eo '[^[:blank:]]+' |tail -1) ":delete" 
	fi
done

for ((i=1;i<count2;i++))
do
	if ((check2[i] == 0))
	then
		echo $(echo ${now[i]} | grep -Eo '[^[:blank:]]+' | tail -1) ":add" 
	fi
done

cat $path/.logtmp.txt > $path/.log.txt
