#!/bin/bash


### This script is used for setting up workstation with all the 
### required tools for working with chef development kit
###
### Author: Sudhir B
###
### List of tools or packages required for this setup are as below
### Chef Development Kit
### Git Version Control System
### Vagrant
### Docker


# Source the configuration file

HOME_DIR=/root/stack/middleware
SCRIPTS_DIR=$HOME_DIR/scripts
SOFTWARE_DIR=$HOME_DIR/software
EXTRACT_DIR=$HOME_DIR/extract


source $SCRIPTS_DIR/etc/software_source.txt
mkdir -p $SCRIPTS_DIR/logs
mkdir -p $SOFTWARE_DIR
touch $SCRIPTS_DIR/logs/log.txt

installChefDk()
{

echo "Check if Chef DK is already installed or not"

if [[ ! -f /bin/chef ]]; then
	echo "Chef is not installed. Installing ChefDk now"
	wget $chefdk_rpm -O $SOFTWARE_DIR/chefdk.rpm >> $SCRIPTS_DIR/logs/log.txt
	yum -y install $SOFTWARE_DIR/chefdk.rpm >> $SCRIPTS_DIR/logs/log.txt
	/bin/chef --version
else
	echo "Chef is already installed."
	/bin/chef --version
fi
}


installVagrant()
{

echo "Check if Vagrant is already installed or not"

if [[ ! -f /bin/vagrant ]]; then
	echo "Vagrant is not installed. Installing Vagrant now"
	wget $vagrant_rpm -O $SOFTWARE_DIR/vagrant.rpm >> $SCRIPTS_DIR/logs/log.txt
	yum -y install $SOFTWARE_DIR/vagrant.rpm >> $SCRIPTS_DIR/logs/log.txt 
	/bin/vagrant status
else
	echo "Vagrant is already installed."
	/bin/vagrant status
fi
}

installGit()
{

echo "Check if Git is already installed or not"

if [[ ! -f /bin/git ]]; then
	echo "Git is not installed. Installing Git now"
	yum -y install git >> $SCRIPTS_DIR/logs/log.txt
	/bin/git --version
else
	echo "Git is already installed"
	/bin/git --version
fi

}

installDocker()
{

echo "Check if Docker is already installed or not"

if [[ ! -f /bin/docker ]]; then
	echo "Docker is not installed. Installing Docker now"
	wget $docker_selinux_rpm -O $SOFTWARE_DIR/docker_selinux_rpm.rpm >> $SCRIPTS_DIR/logs/log.txt
	wget $docker_rpm -O $SOFTWARE_DIR/docker_rpm.rpm >> $SCRIPTS_DIR/logs/log.txt
	yum -y install $SOFTWARE_DIR/docker_selinux_rpm.rpm >> $SCRIPTS_DIR/logs/log.txt
	yum -y install $SOFTWARE_DIR/docker_rpm.rpm >> $SCRIPTS_DIR/logs/log.txt
	/bin/docker --version
	echo "Start the docker service"
	systemctl start docker
else
	echo "Docker is already installed"
	/bin/docker --version
fi
}


### Main Section

installChefDk
installVagrant
installGit
installDocker
