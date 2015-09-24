# Docker image for manage with ansible

FROM centos:centos6
MAINTAINER Isaac Gasi <isaac.gasi@gmail.com>

#
# Install utitiles
#
RUN yum update -y; yum install -y sudo screen

#
# Install SSH
#
RUN yum -y install openssh-server openssh-clients

#
# Setup a root password
#
RUN echo "root:root" | chpasswd

#
# Expose the ports
#
EXPOSE 80
EXPOSE 22

#
# Enable ssh service and aothorized keys
#
CMD    ["/usr/sbin/sshd", "-D"]
RUN service sshd start

ADD files/authorized_keys /root/.ssh/authorized_keys 
RUN chmod 700 /root/.ssh && chmod 600 /root/.ssh/authorized_keys && restorecon -R -v /root/.ssh

