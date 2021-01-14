FROM ubuntu AS builder
WORKDIR /petclinic
#RUN apt-get update && apt-get install -y wget
#RUN wget -O dd-java-agent.jar 'https://repository.sonatype.org/service/local/artifact/maven/redirect?r=central-proxy&g=com.datadoghq&a=dd-java-agent&v=LATEST'

#FROM java:8-alpine
FROM openjdk:8
COPY ./target/spring-petclinic-2.3.1.BUILD-SNAPSHOT.jar /spring-petclinic.jar
RUN sh -c 'touch /hello-boot.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/spring-petclinic.jar"]
