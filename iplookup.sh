
# script to gather information on IP using shodan

echo "Enter Web Address:"
read ADDRESS

IPADDRESS=$(nslookup $ADDRESS | grep -m2 "Address:" | tail -n1 | cut -d : -f 2 | awk '{$1=$1};1')


shodan host $IPADDRESS

