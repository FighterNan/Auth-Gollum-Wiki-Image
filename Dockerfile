FROM ubuntu:16.04

MAINTAINER Nan Zhou <nanzhoumails@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y -q build-essential ruby python python-docutils ruby-bundler libicu-dev libreadline-dev libssl-dev zlib1g-dev git-core ruby-dev
RUN apt-get clean
RUN rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# Install gollum, omnigollum, mniauth-github
RUN gem install omniauth-github
RUN gem install omnigollum
RUN gem install github-markup

# Auth config
COPY config.rb /home/config.rb
WORKDIR /home

# Should be volumed
RUN mkdir wiki_repo

# expose port
EXPOSE 4567

# start service
ENTRYPOINT ["/usr/local/bin/gollum", "/home/wiki_repo", "--config", "config.rb"]




