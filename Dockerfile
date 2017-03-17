FROM ubuntu:14.04

MAINTAINER JiangWeiGitHub <wei.jiang@winsuntech.cn>

# update apt
RUN apt-get update

# install essential packages with apt-get
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install build-essential python-minimal openssh-server libudev-dev git

# install nodejs
RUN wget https://nodejs.org/dist/v6.7.0/node-v6.7.0-linux-x64.tar.xz \
 && tar Jxf node-v6.7.0-linux-x64.tar.xz \
 && \cp -rf ./node-v6.7.0-linux-x64/* /usr/local/

# make some folders
RUN mkdir -p /git/ \
 && cd /git/ \
 && git clone https://github.com/JiangWeiGitHub/Waterwheel.git \
 && cd Waterwheel

# install npm packages
RUN cd /git/Waterwheel/ \
 && npm install

EXPOSE 3000/tcp

WORKDIR "/git/Waterwheel/"

CMD ["npm", "run", "devel"]
