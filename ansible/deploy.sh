#!/bin/bash

# VARS
EC2USERNAME="ubuntu"
KEY="2021-key"
APPLICATION=$1

# Check Arg -> Application
if [ "$APPLICATION" == "" ]
then
cat << HELP

$0 [application name]

Example:

$0 nginx

HELP
exit
fi


# Check dependences
BIN="aws jq mktemp ansible-playbook rm"
for B in $BIN
do
	which $B 1>/dev/null 2>&1
	if [ $? != 0 ]
	then
		echo "You need install \"$B\" to run this script "
		exit 1
	fi
done


# Creating Temp File
TMP=$( mktemp )

# Query using aws cli in ec2 instances.. filtered by tag "Application"
aws ec2 describe-instances \
	--filters --filters "Name=tag:Application,Values=$APPLICATION" \
	--query 'Reservations[].Instances[].{Name:Tags[?Key==`Name`]|[].Value,PublicIP:PublicIpAddress}' \
	| jq .[].PublicIP -r > $TMP

# Run Playbook
ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i $TMP $APPLICATION.yml -u $EC2USERNAME --private-key ../$KEY

# Remove Temp File
rm -f $TMP

