HAPPS_DIR = happs
ENVIRONMENT?=DEV

.PHONY: build push all clean

build:
	./jinja2.sh ${ENVIRONMENT}
	$(MAKE) -C $(HAPPS_DIR) TAG=${TAG} build

push:
	$(MAKE) -C $(HAPPS_DIR) TAG=${TAG} push

all: build push
	TAG=${TAG} docker-compose up

clean: 
	docker-compose down
	docker-compose rm -f
	$(MAKE) -C $(HAPPS_DIR) clean