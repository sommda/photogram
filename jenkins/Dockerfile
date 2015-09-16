FROM jenkins
MAINTAINER Daniele Stroppa (stroppad@amazon.com)

# Install AWS CLI & Docker
USER root
RUN curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py
RUN pip install awscli
RUN curl -sSL https://get.docker.com/gpg | apt-key add -
RUN curl -sSL https://get.docker.com/ | sh
RUN usermod -aG docker jenkins
USER jenkins

# Install Jenkins plugins
COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
