#!/bin/bash

# we read all the necessary data 
read -p "Enter process name or PID: " pid 

pid="$(echo "$pid" | tr [[:upper:]] [[:lower:]])"

read -p "Enter connection state (ec: LISTEN, ESTABLISHED): " conn

conn="$(echo "$conn" | tr [[:lower:]] [[:upper:]])"

read -p "Enter the number of lines of output: " number

if [[ ! "$number" =~ ^[0-9]+$ ]]; then
echo "the number of lines must be a number"
exit 1
fi

read -p "What data do you want to receive from whois (ex: Organization, City, OrgId): " data

# find lines with the desired pid and connection state 
temp=$(sudo netstat -tunapl | awk -v vr1="$pid" -v vr2="$conn" '$0 ~ vr1 && $0 ~ vr2 {print $5}')

if [ -z "$temp" ]; then
echo "no process in this state " 
exit 2
fi

# cut ports and leave unique addresses 
temp=$(echo "$temp" | cut -d: -f1 | sort | uniq -c)

temp=$(echo "$temp" | tail -n "$number" | grep -oP '(\d+\.){3}\d+')

# display IP and requested information from whois
for ip in $temp
do
echo "$ip"
echo "$(whois $ip | awk -F':' /^$data/)" 
done

