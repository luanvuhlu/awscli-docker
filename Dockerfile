FROM centos:centos7
LABEL MAINTAINER luanvuhlu@gmail.com

RUN yum install -y https://centos7.iuscommunity.org/ius-release.rpm
RUN yum update -y
RUN yum install -y python36u python36u-libs python36u-devel python36u-pip
RUN pip3 install awscli --upgrade

RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN yum install -y nodejs

ENTRYPOINT ["aws"]