# FROM ruby:3.1.2

# RUN apt-get update && apt-get install -y npm && npm install -g yarn

# RUN mkdir -p /var/app
# COPY . /var/app
# WORKDIR /var/app

# RUN bundle install

# CMD rails s -b 0.0.0.0

FROM ruby:3.1.2

RUN apt-get update && apt-get install -y npm && npm install -g yarn

RUN mkdir -p /var/app
COPY . /var/app
WORKDIR /var/app

RUN bundle install

# create a directory for the SQLite3 database file
RUN mkdir -p /var/app/db

# copy the database file to the container
COPY db/development.sqlite3 /var/app/db/

# set the directory as a volume
VOLUME /var/app/db

CMD rails s -b 0.0.0.0
