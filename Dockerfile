FROM ubuntu:16.04

# This is in accordance to : https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-get-on-ubuntu-16-04
RUN apt-get update && \
	apt-get install -y openjdk-8-jdk && \
	apt-get install -y ant && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer;

# Fix certificate issues, found as of
# https://bugs.launchpad.net/ubuntu/+source/ca-certificates-java/+bug/983302
RUN apt-get update && \
	apt-get install -y ca-certificates-java && \
	apt-get clean && \
	update-ca-certificates -f && \
	rm -rf /var/lib/apt/lists/* && \
	rm -rf /var/cache/oracle-jdk8-installer;

RUN apt-get update && apt-get -y install unzip && apt-get -y install lsof iproute2

ADD target/universal/try-http4s-0.1.zip /opt/try-http4s-0.1.zip

WORKDIR /opt

RUN unzip /opt/try-http4s-0.1.zip

WORKDIR /opt/try-http4s-0.1/bin

# Setup JAVA_HOME, this is useful for docker commandline
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

ENTRYPOINT ./try-http4s -J-XX:+UnlockExperimentalVMOptions -J-XX:+UseCGroupMemoryLimitForHeap -J-XX:MaxRAMFraction=1 -J-XshowSettings:vm -J-XX:+PrintFlagsFinal -J-Djava.net.preferIPv4Stack=true
