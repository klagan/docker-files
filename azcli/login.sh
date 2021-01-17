#!/bin/bash

# load environment file
if [ -f /var/tmp/${K_az}.env ]
then
  export $(cat /var/tmp/$K_az.env | sed 's/#.*//g' | xargs)
fi

export PS1="$K_certFileName >"

# https://stackoverflow.com/questions/36388465/how-to-set-bash-aliases-for-docker-containers-in-dockerfile
# shopt -s expand_aliases
# echo "alias loginaz='az login --service-principal --username ${K_spId} --tenant ${K_tenantId} --password ${K_certPath}'" >> ~/.bashrc
echo "az login --service-principal --username $K_spId --tenant $K_tenantId --password /var/tmp/${K_az}.pem" > /usr/bin/loginaz && \
    chmod +x /usr/bin/loginaz

loginaz 

/bin/bash
