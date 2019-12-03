FROM centos:centos7
LABEL MAINTAINER luanvv

RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum update -y
RUN yum install -y python36u python36u-libs python36u-devel python36u-pip
RUN pip3 install awscli --upgrade

RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN yum install -y nodejs

RUN yum -y install openssh-server passwd; yum clean all

RUN mkdir /var/run/sshd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 

ADD start.sh /start.sh

RUN chmod 755 /start.sh
# EXPOSE 22

RUN ./start.sh

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
