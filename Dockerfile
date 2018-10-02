FROM ruby:2.4

RUN mkdir /app
WORKDIR /app
COPY . /app

RUN bundle install

