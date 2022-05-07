# MedibankCodeTest

+ I will explain my thought process of this test step by step here:
  - After scanning through the question and the sample answer, I have noted down several key    points of this question.
    1. This script needs to search for key words through all the directories and sub-directories in a given range. Thus, a wildcard(*) should be presented in this script to represent for "all files".
    2. There will be a possiblity of a multiple string search. At this point, a for loop needs to be used in case of the needs of multiple scan through of the designated folders.
    3. Strings should be case insensitive. This means regardless of how the string is inputted, it needs to be accumulative on top of the previous same word search in a case insensitive manner.
    4. The example output has shown that the strings that appear for fewer than 3 times will not be shown in the final result. I used an if statement to eliminate all the strings that do not match the standard.
    5. On top of what appears in the question literally, I have added a few more things to make this script more user-friendly. Such as:
      * Providing an opportunity for the users to input any strings at will
      * Providing an extra layer of function that allows user to choose if they want to keep the research record from previous attempts or starting a brand new search

+ I understand that this question has the potential to be expanded to even a full-scale application project. But I will stop it here for now for the sake of this coding test. I will be grateful if you like my solution. But if you do not, please let me know where I can improve. I have also commented in the code to make some more detailed explaining of the code. Thank you. 


```bash
#! /bin/bash

### Creating a function that does what the script's main function
function wordCounter() {
  echo "Please enter the strings you would like to look for here."
  echo "Please use space to seperate the strings if there are multiple"

  read varname

  for i in $varname
  do
    ### counting the occuraces of the specified strings
    ### -o: Display only matched part of the lines
    ### -r: Search directories recursivly
    ### -i: ignore case 
    ### -l: making a list of each newly occuring string 
    wc = `grep -ori $i ./selectedText/* | wc -l`

    ### Remove every string that occurs less than 3 times in the selected text
    if [ $wc -lt 3 ]
    then
      continue
    else
      echo "$i $wc"  >> ./result.txt
    fi
  done

  ### Sort the results in a numeric descending order and does not repeat themselves for the second search
  ### -k 2: Sort using the second column
  ### -u: Same string does not repeat in a new search
  ### -n: Sort numerically
  ### -r: Sort reversely. Descending numerical order in this case
  cat ./result.txt | sort -k 2 -unr
}

echo "Hi, there! Would you like a new search?"
echo "Input 'YES' for creating a new search"
echo "Input 'NO' for keeping the results for the last search"

read newSearch

### This provides the user a choice to whether erasing history data is necessary.
if [ $newSearch == "YES" ]
then
  ### Deleting everything stored in result.txt temp file
  > ./result.txt
  wordCounter
else
  wordCounter
fi
```