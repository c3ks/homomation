FROM rails:4.2.5

RUN mkdir -p /var/app
COPY Gemfile /var/app/Gemfile
WORKDIR /var/app
RUN bundle install
