FROM danbarber/ruby:2.5.1-node-browsers

RUN mkdir /app
WORKDIR /app

ENV RAILS_ENV test

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install -j20

COPY . ./

RUN yarn install
