# syntax=docker/dockerfile:1

FROM ruby:3.3.3

# RUN mkdir /docker_project

# COPY . /docker_project

# WORKDIR /docker_project

# RUN bundle install

# EXPOSE 80

WORKDIR /app

ENV NODE_VERSION=20.x

COPY . .

RUN curl -fsSL https://deb.nodesource.com/setup_$NODE_VERSION | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg \
    && curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | tee /etc/apt/sources.list.d/caddy-stable.list \
    && apt-get update \
    && apt-get install -y \
    cron \
    nodejs \
    postgresql-client \
    yarn \
    debian-keyring \
    debian-archive-keyring \
    apt-transport-https \
    caddy \
    libvips \
    && yarn install --check-files \
    && bundle check || bundle install --jobs 4