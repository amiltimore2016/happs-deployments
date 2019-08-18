HAPPS_DIR = happs
ENVIRONMENT?=DEV

.PHONY: build push all clean test

build:
	./jinja2.sh ${ENVIRONMENT}
	$(MAKE) -C $(HAPPS_DIR) TAG=${TAG} build

push:
	$(MAKE) -C $(HAPPS_DIR) TAG=${TAG} push

all: build push
	CURRENT_UID=$(id -u):$(id -g) TAG=${TAG} docker-compose up

clean: 
	docker-compose down
	docker-compose rm -f
	$(MAKE) -C $(HAPPS_DIR) clean

test:
	CURRENT_UID=$(id -u):$(id -g) TAG=${TAG} docker-compose up
