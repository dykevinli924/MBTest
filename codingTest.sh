#! /bin/bash

echo "Hi there! Please enter the strings you would like to look for here."
echo "Please use space to seperate the strings if there is multiple"

read varname

for i in $varname
do
wc=`grep -ori $i ./selectedText/* | wc -l`
echo "$i $wc"  >> ./result.txt
done

cat ./result | sort -k 2 -nr