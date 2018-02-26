FROM openshift/base-centos7

MAINTAINER Sanket Kudalkar <sanket.4857@gmail.com>

ENV JAVA_VERSION 1.8.0
ENV GRADLE_VERSION 3.4.1

LABEL io.k8s.display-name="Spring Boot Gradle Application Builder" \
      io.k8s.description="Platform for building and running Spring Boot applications with Gradle build tool" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,java,java8,gradle,springboot"

RUN yum update -y && \
    yum install -y curl && \
    yum install -y java-$JAVA_VERSION-openjdk java-$JAVA_VERSION-openjdk-devel && \
    yum clean all

ENV JAVA_HOME /usr/lib/jvm/java

RUN curl -sL -0 https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -o /tmp/gradle-${GRADLE_VERSION}-bin.zip && \
    unzip /tmp/gradle-${GRADLE_VERSION}-bin.zip -d /usr/local/ && \
    rm /tmp/gradle-${GRADLE_VERSION}-bin.zip && \
    mv /usr/local/gradle-${GRADLE_VERSION} /usr/local/gradle && \
    ln -sf /usr/local/gradle/bin/gradle /usr/local/bin/gradle

ENV PATH=/opt/gradle/bin/:/usr/lib/jvm/java/:$PATH

COPY ./.s2i/bin /usr/local/s2i
LABEL io.openshift.s2i.scripts-url=image:///usr/local/s2i

RUN chown -R 1001:0 /opt/app-root

USER 1001
EXPOSE 8080
