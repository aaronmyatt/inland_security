FROM ruby:latest

ENV PROJECT_ROOT=/app
WORKDIR $PROJECT_ROOT
ADD . $PROJECT_ROOT

RUN apt-get update -qq && apt-get install -y build-essential nodejs

RUN gem install bundler
RUN bundle install

VOLUME [ "/app" ]
EXPOSE 3000