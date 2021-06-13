# Script Task
___
## What commands are used on this line? 

```Shell
sudo netstat -tunapl | awk '/firefox/ {print $5}' | cut -d: -f1 | sort | uniq -c | sort | tail -n5 | grep -oP '(\d+\.){3}\d+' | while read IP ; do whois $IP | awk -F':' '/^Organization/ {print $2}' ; done
```
1. `netstat` - print network connections, routing tables, interface statistics, masquerade connections, and multicast memberships
    > This program is obsolete. Replacement for netstat is `ss`

	- `--tcp|-t` - Display only TCP connections
	- `--udp|-u` - Display only UDP connections
	- `--numeric|-n` - Show numerical addresses instead of trying to determine symbolic host, port or user names
	- `--all|-a` - 	Displays all active connections and the TCP and UDP ports on which the computer is listening
	- `--program|-p` - Show the PID and name of the program to which each socket belongs
	- `--listening|-l` - Show only listening sockets. (These are omitted by default)
2. `awk '/firefox/ {print $5}'` - `awk` command looking all the line which matches with the ‘firefox’ and prints the fifth field (address and port number of the remote end of the socket) and discards the rest of the line
3. `cut -d: -f1` - cut off the port and leave only the ip address 
    - `-d, --delimiter` - use DELIM instead of TAB for field delimiter
    - `-f, --fields` - select  only these fields
4. `sort` -  sorting is first performed using the first character. Since this is the same for all lines, the sorting then proceeds to the second character. Since the second character is unique for each line, the sorting ends there.
5. `uniq -c` - it tells how many times a line was repeated by displaying a number as a prefix with the line.
6. `sort` - again 
7. `tail -n5` - prints the last 5 lines instead of last 10 lines.
8. `grep -oP '(\d+\.){3}\d+'` - output only ip address
    - `'(\d+\.){3}\d+'` - look for an integer with a dot three times and an integer at the end 
    - `-o` - show only the part of a matching line that matches PATTERN.
    - `-P` - interpret PATTERN as a Perl regular expression.
9. `while read IP ; do whois $IP | awk -F':' '/^Organization/ {print $2}' ; done` - pass IP addresses to the while loop , through the while loop, execute the whois command, the awk command will find all lines starting with Organization and display the second field

# My Script 
___
This script shows information about active Internet connections. 
Example:
```
Enter process name or PID: vagrant
Enter connection state(ex: ESTABLISHED, LISTEN): established
Enter the number of lines of output: 5
What data do you want to receive from whois (ex: Organization, City, OrgId): City
10.0.0.3
City:           Los Angeles
192.168.15.1
City:           Los Angeles
``` 