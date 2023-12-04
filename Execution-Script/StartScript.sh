#!/bin/bash


# Author: Ankit Raut 

# Description: 

setVariables()
{
    #defining directory path.
    # path="/home/ubuntu/Node-Project"
    path="/home/ankitraut0987/shopping-project"
    
    #defining nginx path
    nginx_path="/etc/nginx/sites-enabled"

}

getVariables()
{
    echo "Path:$path"
    echo "Nginx Path:$nginx_path"

}


setVariables

#Install Nginx Server
sudo apt-get install nginx -y >/dev/null || { echo "Failed to Install Nginx Server"; exit 1; }

#Configuring Nginx Server:
sudo rm "$nginx_path/default" || echo "Default Config File Not Found"
cd "$path/Execution-Script/"
sudo cp "default" "$nginx_path/"
sudo systemctl restart nginx

cd

sudo apt-get install docker
sudo apt-get install docker-compose

cd "$path"
sudo docker-compose up -d || echo "error in compose file"

