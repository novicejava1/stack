# stack

### This git repository is used for setting up workstation with all the
### required tools for working with chef development kit
###
### Author: Sudhir B
###
### List of tools or packages required for this setup are as below
### Chef Development Kit
### Git Version Control System
### Vagrant
### Docker

### How to use this repository
[root@desktop1 ~]# pwd
/root
[root@desktop1 ~]# git clone https://github.com/novicejava1/stack.git
Cloning into 'stack'...
remote: Counting objects: 50, done.
remote: Compressing objects: 100% (36/36), done.
remote: Total 50 (delta 3), reused 50 (delta 3), pack-reused 0
Unpacking objects: 100% (50/50), done.
[root@desktop1 ~]# tree stack
stack
├── middleware
│   ├── extract
│   │   └── test.txt
│   ├── scripts
│   │   ├── bin
│   │   │   └── chefWorkstationSetup.sh
│   │   ├── etc
│   │   │   └── software_source.txt
│   │   └── logs
│   │       └── log.txt
│   └── software
│       ├── chefdk.rpm
│       ├── docker_rpm.rpm
│       ├── docker_selinux_rpm.rpm
│       └── vagrant.rpm
└── README.md


### Run the below script to install all the required tools for setting up the workstation chef usage
[root@desktop1 ~]# ./stack/middleware/scripts/bin/chefWorkstationSetup.sh
