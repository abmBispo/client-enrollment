FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs

ENV RAILS_ROOT /app
RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN gem install bundler:2.0.1
RUN bundle install

COPY . /app

# precompile assets if it is required
# RUN bundle exec rake assets:precompile
EXPOSE 3000
