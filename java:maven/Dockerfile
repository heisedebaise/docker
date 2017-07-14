FROM java:base

# install maven-3.5.0
RUN cd /usr/java \
    && wget http://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz \
    && tar -zxf apache-maven-3.5.0-bin.tar.gz \
    && rm -rf apache-maven-3.5.0-bin.tar.gz

ENV MAVEN_HOME /usr/java/apache-maven-3.5.0
ENV PATH $PATH:$MAVEN_HOME/bin

# settings.xml
WORKDIR /root/.m2
RUN echo '<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"' > settings.xml \
    && echo '    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"' >> settings.xml \
    && echo '    xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0' >> settings.xml \
    && echo '                        https://maven.apache.org/xsd/settings-1.0.0.xsd">' >> settings.xml \
    && echo '    <localRepository/>' >> settings.xml \
    && echo '    <interactiveMode/>' >> settings.xml \
    && echo '    <usePluginRegistry/>' >> settings.xml \
    && echo '    <offline/>' >> settings.xml \
    && echo '    <pluginGroups/>' >> settings.xml \
    && echo '    <servers/>' >> settings.xml \
    && echo '    <mirrors>' >> settings.xml \
    && echo '        <mirror>' >> settings.xml \
    && echo '        <id>aliyun</id>' >> settings.xml \
    && echo '        <name>aliyun</name>' >> settings.xml \
    && echo '        <url>http://maven.aliyun.com/nexus/content/groups/public</url>' >> settings.xml \
    && echo '        <mirrorOf>central</mirrorOf>' >> settings.xml \
    && echo '        </mirror>' >> settings.xml \
    && echo '    </mirrors>' >> settings.xml \
    && echo '    <proxies/>' >> settings.xml \
    && echo '    <profiles>' >> settings.xml \
    && echo '        <profile>' >> settings.xml \
    && echo '            <id>jdk</id>' >> settings.xml \
    && echo '            <activation>' >> settings.xml \
    && echo '                <activeByDefault>true</activeByDefault>' >> settings.xml \
    && echo '                <jdk>1.8</jdk>' >> settings.xml \
    && echo '            </activation>' >> settings.xml \
    && echo '            <properties>' >> settings.xml \
    && echo '                <maven.compiler.source>1.8</maven.compiler.source>' >> settings.xml \
    && echo '                <maven.compiler.target>1.8</maven.compiler.target>' >> settings.xml \
    && echo '                <maven.compiler.compilerVersion>1.8</maven.compiler.compilerVersion>' >> settings.xml \
    && echo '            </properties>' >> settings.xml \
    && echo '        </profile>' >> settings.xml \
    && echo '    </profiles>' >> settings.xml \
    && echo '    <activeProfiles/>' >> settings.xml \
    && echo '</settings>' >> settings.xml

VOLUME ["/root/.m2"]
