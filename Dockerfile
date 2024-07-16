# syntax=docker/dockerfile:1
FROM ruby:3.3.3
RUN mkdir /docker_project
COPY . /docker_project
WORKDIR /docker_project
RUN bundle install
EXPOSE 80