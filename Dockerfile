FROM ubuntu:14.04
MAINTAINER Martin Fleischer

# configure packages using default values
ENV DEBIAN_FRONTEND noninteractive

# make sure the package repository is up to date
RUN apt-get update

# Install required packages
RUN apt-get install -y wget parallel ruby ruby-dev build-essential fontconfig

# install phantomjs
RUN mkdir drivers
RUN wget -q -P drivers https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2
RUN tar -C drivers -xjf /drivers/phantomjs-1.9.7-linux-x86_64.tar.bz2
RUN rm -Rf /drivers/phantomjs-1.9.7-linux-x86_64.tar.bz2
RUN ln -s /drivers/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/bin/phantomjs
RUN chmod 755 /usr/bin/phantomjs

# install the required gems
RUN gem sources -a http://rubygems.org
RUN gem install bundler --no-ri --no-rdoc --pre 
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle install

# add the whole project
ADD . uats

WORKDIR /uats
