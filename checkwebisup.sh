#!/bin/bash

weburl="localhost"

if curl -s --head  --request GET $weburl | grep "300 OK"; then
    result="The website is up."
    echo $(date +"%F %T : $result") >> webisup.log
else
    result="The website is down. Will restart the website."
    echo $(date +"%F %T : $result") >> webisup.log
    
    # Restring process
    cd ../simulator
    ./app_stop.sh
    ./app_serve.sh

    cd -
    result="Restart the website successfully."
    echo $(date +"%F %T : $result") >> webisup.log
fi
