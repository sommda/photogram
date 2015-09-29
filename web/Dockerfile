FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir -p /opt/web
WORKDIR /tmp
ADD Gemfile /tmp/
ADD Gemfile.lock /tmp/
RUN bundle install
ADD . /opt/web
WORKDIR /opt/web
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /var/tmp/*
ENV RAILS_ENV production
ENV SECRET_KEY_BASE eeb58e7c5a1f01d5f7ac66cda0a935dd42f994ccd599d848f90f0c8f264ffc89e3102a01c0dda815f1834de4e937d180ef6004efa55258df2d6be4a2e5a2c21f
ENV RAILS_SERVE_STATIC_FILES true
RUN bundle exec rake assets:precompile
