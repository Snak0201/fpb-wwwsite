FROM ruby:3.2.2-bookworm
RUN apt update -qq && apt install -y build-essential libpq-dev nodejs default-mysql-client
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD . /app/
