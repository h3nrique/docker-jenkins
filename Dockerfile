FROM jenkins/jenkins:lts-jdk11
MAINTAINER Paulo Henrique Alves <paulohenriqueas13@gmail.com>
USER root
RUN apt update && apt install maven -y
USER jenkins
