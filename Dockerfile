FROM ruby:latest

ENV PROJECT_ROOT=/app
WORKDIR $PROJECT_ROOT
ADD . $PROJECT_ROOT

RUN apt-get update -qq && apt-get install -y build-essential
RUN apt-get install -y --no-install-recommends apt-utils apt-transport-https

RUN apt-get install -y netselect-apt && netselect-apt -c Japan
RUN cat sources.list
RUN mv sources.list /etc/apt/sources.list

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

RUN curl -sL https://deb.nodesource.com/setup_9.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs yarn

RUN gem install bundler rails

RUN bundle install

EXPOSE 3000

VOLUME [ "/app" ]