FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir -p /opt/web
WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN bundle install
ADD . /opt/web
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
