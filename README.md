Ansible for building centos lamp optimization to Drupal8
========================================================

Create a Docker containers in base a Image pre-configured with centos,  and use Ansible for Application Deployment + Configuration Management + Continuous Delivery.

##Requirements

 - Docker (last version for your SO)
 - Ansible (last version)
 - SSH client

##Features

### Dockerfile
 - Centos 6.6
 - SSH deamon

### Ansible
 - httpd
 - php5.3 stable/php5.5 unstable
 - mysql
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

##Use

```
# Clone repository
git clone https://github.com/igasi/ansible_centos_drupal8.git
cd path/to/ansible_centos_drupal8

# Add rsa key to autorized keys
cp files/example_authorized_keys files/authorized_keys
cat ~/.ssh/id_rsa.pub >> files/authorized_keys

# Build a docker image base
cd docker/tutum-centos && docker build -t tutum/centos:centos7 centos7
docker run -d -p 2222:22 -e AUTHORIZED_KEYS="`cat ~/.ssh/id_rsa.pub`" -P -v /path/to/code/project:/var/www/html:rw --name «project_name» tutum/centos
cd ../..

# Check ssh conection
docker ps
docker inspect «project_name» | grep IPAddress
ssh root@«IPAddress»

# Into container
exit

# Configure hosts
echo «IPAddress» >> hosts

# Get roles from ansible galaxy
# ansible-galaxy install -p roles/ rvm_io.rvm1-ruby
# git clone git@github.com:geerlingguy/ansible-role-php.git roles/ansible-role-php

#Note: Please review  build.yml for select version of php

# Run ansible
ansible-playbook build.yml -i hosts


##Enjoy !!
```


##Info

 - Password for root is root
 - Vefiry the last version of docker and ansible (posible troubles with backward versions in ssh)