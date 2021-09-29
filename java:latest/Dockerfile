FROM centos:base

RUN dnf install -y epel-release \
    && dnf upgrade -y \
    && dnf install -y java-latest-openjdk-devel

ENV JAVA_HOME /usr/lib/jvm/java
