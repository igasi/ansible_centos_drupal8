Ansible for building centos lamp optimization to Drupal8
========================================================

Create a Docker containers in base a Image pre-configured with centos,  and use Ansible for Application Deployment + Configuration Management + Continuous Delivery.

## Requirements

 - Docker (last version for your SO)
 - Ansible (last version)
 - SSH client

## Features

### Dockerfile
 - Centos 6.7
 - SSH deamon

### Ansible
 - httpd
 - php5.3 stable/php5.5 unstable/php5.6
 - mysqld 5.5
 - composer
 - drush
 - vim
 - git
 - wget
 - tar
 - curl
 - add autorized keys
 - ruby
 - compass


## use for run functional container
```
docker pull igasi/drupal8centos7base:latest
docker run --privileged=true -d -t -P -v /path/to/code/project:/var/www/html:rw --name project_name igasi/drupal8centos67base:latest

```

## How to build docker container base

```
# Clone repository
git clone https://github.com/igasi/ansible_centos_drupal8.git
cd path/to/ansible_centos_drupal8

# Add rsa key to autorized keys
cp files/example_authorized_keys files/authorized_keys
cat ~/.ssh/id_rsa.pub >> files/authorized_keys

# Build a docker image base
docker pull centos
docker build -t base .

#Check image base creation
docker images base

# Run a container specific for project with share code
docker run -d -t -P -v /path/to/code/project:/var/www/html:ro|rw --name «project_name» base

# Check ssh conection
docker ps
docker inspect «project_name» | grep IPAddress
ssh root@«IPAddress»

# Into container
exit

```

## How to prepare docker container with ansible
```
# Configure hosts
echo «IPAddress» >> hosts

# Get roles from ansible galaxy
ansible-galaxy install -p roles/ rvm_io.rvm1-ruby
git clone git@github.com:geerlingguy/ansible-role-php.git roles/ansible-role-php

#Note: Please review  build.yml for select version of php or custom install

# Run ansible
ansible-playbook build.yml -i hosts

```


## How to generate a docker image from docker container

```
docker ps
docker commit <exiting-container> <hub-user>/<repo-name>[:<tag>]
```
Note: The docker image is build based on existing container with current status




## Info

 - Password for root is root
 - mysql: db=drupal8 user=drupal8 pass=drupal8
 - Vefiry the last version of docker and ansible (posible troubles with backward versions in ssh)