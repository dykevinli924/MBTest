#! /bin/bash

function wordCounter() {
  echo "Please enter the strings you would like to look for here."
  echo "Please use space to seperate the strings if there are multiple"

  read varname

  for i in $varname
  do
    wc=`grep -ori $i ./selectedText/* | wc -l`

    if [ $wc -lt 3 ]
    then
      continue
    else
      echo "$i $wc"  >> ./result.txt
    fi
  done

  cat ./result.txt | sort -k 2 -unr
}

echo "Hi, there! Would you like a new search?"
echo "Input 'YES' for creating a new search"
echo "Input 'NO' for keeping the results for the last search"

read newSearch

if [ $newSearch == "YES" ]
then
  > ./result.txt
  wordCounter
else
  wordCounter
fi