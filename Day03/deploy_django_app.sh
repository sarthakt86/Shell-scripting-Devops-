#!/bin/bash

<<Task
Deploy a  Django app 
and hanle the code for errors 
Task

code_clone() {
	echo "Clonning the Django app. . . "
	git clone https://github.com/LondheShubham153/django-notes-app.git

}

install_requirements() {
	echo "Installing dependencies"
	sudo apt-get install docker.io nginx -y
}

required_restart() {
	sudo chown $USER /var/run/docker.sock
	sudo systemctl enable docker
	sudo systemctl enable nginx
        sudo systemctl restart docker 	
}

deploy() {
docker build -t notes-app .
docker run -d -p 8000:8000 notes-app:latest
}

echo "******** DEPLYMENT STARTED ********"


if ! code_clone; then
	echo "the code directory already exists"
	cd django-notes-app
fi

if ! install_requirements; then 
	echo "installation failed"
	ecit 1
fi
if ! required_restarts; then
	echo "System fault identified"
	exit 1
fi

if ! deploy; then 
	echo "Deploment failed , mailing the admin"
	# sendmail
fi


echo "******** DEPLOYMENT DONE ********"



















