FROM ruby:2.3.7

MAINTAINER salehp@gmail.com

RUN apt-get update -qq && \
    apt-get install -y build-essential && \
    apt-get install -y net-tools

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app

ENV PORT 4567
EXPOSE 4567
CMD ["ruby", "app.rb"]
