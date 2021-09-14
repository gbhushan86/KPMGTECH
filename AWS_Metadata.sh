#!/bin/bash
sudo apt-get update && apt-get install -y jq awscli cloud-utils

###AWS Login###
aws configure set aws_access_key_id "$AWS_Access_Key" && aws configure set aws_secret_access_key "$AWS_Secret_Key" && aws configure set default.region "$AWS_Default_Region"

ec2metadata=`curl --silent http://169.254.169.254/latest/dynamic/instance-identity/document`
echo $"ec2metadata of the instance is:"
echo
echo $ec2metadata
curl -s http://169.254.169.254/latest/meta-data
echo
echo
read -p "Please enter key to fetch value: " input

value="`curl -s http://169.254.169.254/latest/meta-data/${input}`"
echo $value


 