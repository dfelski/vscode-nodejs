FROM dfelski/vscode
MAINTAINER Darius Felski
LABEL Description="Visual Studio Code with NodeJS 8.15.0" Version="0.2.0"

ARG NODE_VERSION=8.15.0

# add yarn repository
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# update packages
RUN apt-get update && apt-get upgrade -y

# install node.js
RUN mkdir -p /opt/nodejs
ADD https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz /tmp
RUN cd /tmp && tar -xzf node-v8*.tar.gz -C /opt/nodejs/ --strip-components=1
ENV PATH="/opt/nodejs/bin:${PATH}"

# install yarn
RUN apt install -y --no-install-recommends yarn
