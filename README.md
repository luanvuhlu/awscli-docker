# awscli-docker
Containerized AWS CLI on Centos7

## Build

```
docker build -t luanvv/aws-cli .
```

```
luanvv/aws-cli : Docker image name
```

## Usage

```
docker run -d --name awscli -p 22 luanvv/aws-cli
```

```
-d              : run in background
--name aws-cli  : container's name
-p 22           : map localhost port with container port 22
luanvv/aws-cli  : Docker image name
```

Check SSH Port

```
docker port awscli
```

Output example:

```
22/tcp -> 0.0.0.0:32770
```

## Install

I don't want expose any security credentials. So, instead of export AWS Credentials via environment variables, you should connect to Docker container and configure by hand.  

Connect direct from docker container:

```
docker exec -it awscli bash
```

Config AWS credentials

```
aws configure
```


## References

[AWS CLI Docs](https://aws.amazon.com/documentation/cli/)  
[CentOS SSH Dockerfiles](https://github.com/CentOS/CentOS-Dockerfiles/tree/master/ssh/centos7)  
[mesosphere/aws-cli](https://github.com/mesosphere/aws-cli)  


