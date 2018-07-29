#FROM centos/ruby-24-centos7
FROM ruby:2.5-alpine

RUN apk update && apk add build-base nodejs postgresql-dev
RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock hello-world.rb ./
RUN bundle install --binstubs

ENTRYPOINT ["ruby", "/app/hello-world.rb"]
