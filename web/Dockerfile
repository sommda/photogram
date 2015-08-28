FROM ruby:2.2.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /dvo305-demo
WORKDIR /dvo305-demo
ADD Gemfile /dvo305-demo/Gemfile
RUN bundle install
ADD . /dvo305-demo
