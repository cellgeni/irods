#!/bin/bash

sed -i "s/USER/$(cat /secret/IRODS_USER_NAME)/" /root/.irods/irods_environment.json
echo $(cat /secret/IRODS_PASSWORD) | iinit
