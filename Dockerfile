FROM jenkins/jenkins:lts-jdk11
MAINTAINER Paulo Henrique Alves <paulohenriqueas13@gmail.com>
VOLUME /var/run/docker.sock
USER root
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian bullseye stable" > /etc/apt/sources.list.d/docker.list && \
    apt update && apt install maven docker-ce-cli -y
USER jenkins
