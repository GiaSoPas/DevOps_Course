#!/bin/bash

if [ -z "$1" ]; then
  echo "no arguments. Plese enter url https://github.com/$user/$repo"
  exit 1
fi

user=$(echo "$1" | awk -F'/' '{print $4}')
rep=$(echo "$1" | awk -F'/' '{print $5}')
echo "Checks if there are open pull requests for a repository"
echo "_______________________________________________________"
echo "user = $user"
echo "repo = $rep"

string=$(curl -s "https://api.github.com/repos/"$user"/"$rep"/pulls?per_page=1000&state=open")
#string=$(curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/"$user"/"$rep"/pulls?state=open)
if [ "$?" -ne 0 ]
then
  echo "error in the curl coommand"
  exit 2
fi

name=$(echo "$string" | jq '.[].user.login')

if [ "$?" -ne 0 ]
then
  echo "error in jq command."
  exit 3
fi
echo "__________________________________"
if [ -z "$name" ]; then
  echo "Answer: No open PR"
  exit 4
else
  echo "Answer: There are open PR"
fi
echo "__________________________________"

countname=$(echo "$name" | sort | uniq -c | awk '{if ($1>1) print $1, $2}')
echo "List of the most productive contributors (authors of more than 1 open PR)"
echo "Number: Name:"
echo "$countname"

labels=$(echo "$string" | jq '.[].labels[0].name')

OIFS=$IFS
IFS=$'\n'
array1=($name)
array2=($labels)
IFS=$OIFS

count=${#array1[@]}
for i in `seq 1 $count`
do
    if [[ ${array2[$i-1]} != "null" ]];
    then
        namelabel=${namelabel}$'\n'${array1[$i-1]}${array2[$i-1]}
    fi
done

countlabels=$(echo "$namelabel" | sed '1d' | sort | uniq -c)
echo "__________________________________________________________"
echo "Number of PRs each contributor has created with the labels"
echo "Number: Name: Label:"
echo "$countlabels"
