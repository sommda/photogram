FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN apt-get install -y qt5-default libqt5webkit5-dev
RUN apt-get install -y xvfb x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic x11-apps
RUN mkdir -p /opt/test
WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN bundle install
ADD . /opt/test
WORKDIR /opt/test
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/*
CMD bash -x test.sh



