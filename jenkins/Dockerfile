FROM jenkins
MAINTAINER Daniele Stroppa (stroppad@amazon.com)

# Install AWS CLI
USER root
RUN curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py
RUN pip install awscli
USER jenkins

# Install Jenkins plugins
COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
