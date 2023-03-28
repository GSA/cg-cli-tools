FROM ubuntu:latest

RUN apt-get update -y 
RUN apt-get install -y wget gnupg2
ADD cli.cloudfoundry.org.key .
RUN cat cli.cloudfoundry.org.key | apt-key add -
RUN echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list
RUN apt-get update -y 
RUN apt-get install cf8-cli -y

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
