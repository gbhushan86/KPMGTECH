#!/bin/bash

sudo apt-get update && apt-get install -y 

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

####Azure Login######

az login --service-principal --username "$AZURE_aadClientId" --password "$AZURE_aadClientSecret" --tenant "$AZURE_tenantId"


###Fetch Azure Metadata for Instance####
Details=`curl -H Metadata:true "http://169.254.169.254/metadata/instance?api-version=2019-06-01" | jq '.'` ###For Getting entire Details###
echo $"Metadata of the Instance is:"
echo 
echo $Details 

#####To Fetch Specific Value#####

value='.compute.vmSize' ####for fetching vm size#####
value1='.network.interface[].macAddress'  ####similarly for Network and Other storage related queries it varies#####


curl -s -H Metadata:true "http://169.254.169.254/metadata/instance?api-version=2019-06-01" | jq -r '$value'						
