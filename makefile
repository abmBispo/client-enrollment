.PHONY: all build push deploy run stop

AWS_ENDPOINT=867160744824.dkr.ecr.us-east-1.amazonaws.com
APP=$(AWS_ACCOUNT)/client-enrollment
PROXY_SERVER=$(AWS_ACCOUNT)/client-enrollment-nginx

all: login build tag push deploy

login: aws ecr get-login-password --region us-east-1 | sudo docker login --username AWS --password-stdin $(AWS_ENDPOINT)

build:
	RACK_ENV=$(RAILS_ENV) sudo docker build -t $(APP) -f docker/app/Dockerfile .
	sudo docker build -t $(PROXY_SERVER) -f docker/web/Dockerfile .

tag:
	sudo docker tag $(APP) $(APP):latest
	sudo docker tag $(PROXY_SERVER) $(PROXY_SERVER):latest

push:
	sudo docker push $(APP):latest
	sudo docker push $(PROXY_SERVER):latest

deploy:
	eb deploy $(RAILS_ENV)

run:
	docker-compose up -d

stop:
	docker-compose down
