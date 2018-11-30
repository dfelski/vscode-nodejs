FROM ubuntu:18.04
MAINTAINER Darius Felski
LABEL Description="Visual Studio Code with latest NodeJS 8.x Version" Version="0.1.0"

# install some basics first
RUN apt update && apt install -y software-properties-common apt-transport-https wget curl

# add vscode repository
RUN wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

# add yarn repository
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# update packages
RUN apt-get update && apt-get upgrade -y

# install node.js
RUN mkdir -p /opt/nodejs
ADD https://nodejs.org/dist/latest-v8.x/node-v8.14.0-linux-x64.tar.gz /tmp
RUN cd /tmp && tar -xzf node-v8*.tar.gz -C /opt/nodejs/ --strip-components=1
ENV PATH="/opt/nodejs/bin:${PATH}"

# install some dependencies to run vscode gui properly
RUN apt install -y libasound2

# install vscode
RUN apt install -y code

# install yarn
RUN apt install -y --no-install-recommends yarn

CMD ["/usr/share/code/code"]
