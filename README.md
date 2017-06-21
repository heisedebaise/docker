# Dockerfile

## java-base
```bash
docker build -t java:base docker/java\:base/
```

## java-tomcat
```bash
docker build -t java:tomcat docker/java\:tomcat/

docker run -d -p 8080:8080 --name tomcat java:tomcat
```

## java-maven
```bash
docker build -t java:maven docker/java\:maven/
```

## jenkins-maven
```bash
docker build -t jenkins:maven docker/jenkins\:maven/
```
