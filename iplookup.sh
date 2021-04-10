
# script to gather information on IP using shodan

if [ -z $1 ]
then 
        echo "Illegal usage"
        echo "Usage $0 <url>"
        exit 1
fi


#echo "Enter Web Address:"
#read ADDRESS

IPADDRESS=$(nslookup $1 | grep -m2 "Address:" | tail -n1 | cut -d : -f 2 | awk '{$1=$1};1')


shodan host $IPADDRESS
shodan domain $1
shodan honeyscore $IPADDRESS

echo "IP ADDRESS HISTORY"

shodan host --history $IPADDRESS

