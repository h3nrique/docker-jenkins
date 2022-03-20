FROM jenkins/jenkins:lts-jdk11
MAINTAINER Paulo Henrique Alves <paulohenriqueas13@gmail.com>
HEALTHCHECK --interval=30s --timeout=3s CMD curl --fail http://localhost:8080/login || exit 1
VOLUME /var/run/docker.sock
USER root
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian bullseye stable" > /etc/apt/sources.list.d/docker.list && \
    apt update && apt install maven docker-ce-cli -y && \
    groupadd docker && usermod -aG docker jenkins
USER jenkins
