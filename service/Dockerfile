FROM ubuntu:24.04

ENV JAVA_HOME /opt/jdk
ENV PATH $JAVA_HOME/bin:$PATH

RUN apt-get update -y

# X64
#ADD "https://cdn.azul.com/zulu/bin/zulu17.46.27-ca-crac-jdk17.0.9-linux_x64.tar.gz" $JAVA_HOME/openjdk.tar.gz

# AARCH64
ADD "https://cdn.azul.com/zulu/bin/zulu21.28.89-ca-crac-jdk21.0.0-linux_aarch64.tar.gz" $JAVA_HOME/openjdk.tar.gz

RUN tar --extract --file $JAVA_HOME/openjdk.tar.gz --directory "$JAVA_HOME" --strip-components 1; rm $JAVA_HOME/openjdk.tar.gz;

RUN mkdir -p /opt/crac-files

COPY target/service-0.0.1-SNAPSHOT.jar  /opt/app/service-0.0.1-SNAPSHOT.jar

EXPOSE 8080