# Client Enrollment API
Trustfull integrity repo's current state:

[![Coverage Status](https://coveralls.io/repos/github/abmBispo/client-enrollment/badge.svg?branch=master)](https://coveralls.io/github/abmBispo/client-enrollment?branch=master) [![Build Status](https://travis-ci.org/abmBispo/client-enrollment.svg?branch=master)](https://travis-ci.org/abmBispo/client-enrollment) [![Maintainability](https://api.codeclimate.com/v1/badges/6c81ee76252c886dcd0e/maintainability)](https://codeclimate.com/github/abmBispo/client-enrollment/maintainability)

## INTENTION
Ruby on Rails project for showing my current best coding quality.
## SETUP
### Clone repo
You can easily put this project running on your machine (or even in a cloud structure). In order to de this you need first `git glone` this repo.
```sh
git clone git@github.com:abmBispo/client-enrollment.git
```
### Database & Bundling
Therefore you also got to install Postgres 9.6 locally on your machine, in a cloud or even (I recommend it) run it in a local docker container. For this you can execute the following:
```sh
docker run --name postgres-11\
            -e POSTGRES_PASSWORD=postgres\
            -d\
            -p 5432:5432\
            -v $HOME/docker/volumes/postgres:/var/lib/postgresql/data\
            postgres:11
```
Once you've ran that the docker container will be executing until you stop it manualy. To force container to stop you could use `docker ps -a -q -f "name=postgres-11"` to get container's ID and then run `docker stop CONTAINER_ID`. Since you've used `-v` flag to indicate a persistence volume to docker, all changes you've made during it's execution will be kept safe, with no data losses. So you could run it again with `docker start CONTAINER_ID`.
Now that you have a postgres running you can go to app's root folder and setup with:
```sh
gem install bundler
bundle install
bundle exec rails db:create db:migrate db:seed
```
## Automated tests
As you probably saw this project have 100% of test coverage over it's models and controllers classes.
You can run locally the same tests by:
```sh
bundle exec rails test
```
## Documentation
As the project is an API I choose to keep it's documentation in Postman. So [here](https://documenter.getpostman.com/view/479599/T17KcmCm?version=latest#937f54bb-98e8-42c4-8003-8163295b9514) you will have a route detailed documentation on how to interact with this API.
## Dependencies
* Ruby version: **2.6.5**
* PostgreSQL version: **12.1**
* Docker version: **18.09.6, build 481bc77**

## Run project
```sh
bundle exec rails server
```

## Relevant links

[API documentation](https://documenter.getpostman.com/view/479599/T17KcmCm?version=latest#937f54bb-98e8-42c4-8003-8163295b9514)
* [Don't install Postgres. Docker pull Postgres](https://hackernoon.com/dont-install-postgres-docker-pull-postgres-bee20e200198)
