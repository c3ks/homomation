FROM rails:4.2.5
MAINTAINER Philipp Hirsch <itself@hanspolo.net>
RUN mkdir -p /var/app
COPY Gemfile /var/app/Gemfile
WORKDIR /var/app
RUN bundle install
