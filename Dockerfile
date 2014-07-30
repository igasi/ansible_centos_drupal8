# Docker image for manage with ansible

FROM centos:centos6
MAINTAINER Isaac Gasi <isaac.gasi@gmail.com>

#
# Install utitiles
#
RUN yum install -y sudo screen 

#
# Install SSH
#
RUN yum -y install openssh-server openssh-clients

#
# Setup a root password; simple enough to remember, but hard enough that
# it won't be cracked immediately.  (ha!)
#
RUN echo "root:root" | chpasswd

#
# Expose the ports
#
EXPOSE 80
EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
RUN service sshd start

ADD files/authorized_keys /root/.ssh/authorized_keys

