Ansible for building centos lamp optimization to Drupal8
========================================================

Create a Docker containers in base a Image pre-configured with centos,  and use Ansible for Application Deployment + Configuration Management + Continuous Delivery.

##Requirements

 - Docker (last version for your SO)
 - Ansible (last version)
 - SSH client

##Features

### Dockerfile
 - Centos 6.5
 - SSH deamon

### Ansible
 - httpd
 - php5.5
 - mysql
 - composer
 - drush
 - vim
 - git
 - add autorized keys

##Use

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

# Configure hosts
«IPAddress» >> hosts

# Run ansible
ansible-playbook build.yml -i hosts


##Enjoy !!
```


##Info

 - Password for root is root
 - Vefiry the last version of docker and ansible (posible troubles with backward versions in ssh)