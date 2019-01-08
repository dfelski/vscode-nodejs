FROM dfelski/vscode
MAINTAINER Darius Felski
LABEL Description="Visual Studio Code with preinstalled Node Version Manager"

COPY startup.sh /startup.sh

CMD ["/startup.sh", "${NVM_VERSION}", "${NODE_VERSION}"]
