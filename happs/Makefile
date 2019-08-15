DEFAULT_TAG:=latest
IMAGE_URL:=amiltimore2016/happs
HAPPS_URL:=https://bitbucket.org/kryptonmlt/happs.git

DEFAULT_IMAGE_NAME:=${IMAGE_URL}:${DEFAULT_TAG}
IMAGE_NAME:=${IMAGE_URL}:${TAG}

build: checkout
ifeq ($(TAG),)
	docker build -t ${DEFAULT_IMAGE_NAME} .
else
	docker build -t ${IMAGE_NAME} .
endif

checkout: clean
	mkdir -p src && git clone ${HAPPS_URL} src/

push:
ifeq ($(TAG),)
	docker push ${DEFAULT_IMAGE_NAME}
else
	docker push ${IMAGE_NAME}
endif

deploy: build push

all: build push test

test:
	ifeq($(TAG),)
		docker run -it --net=host -p 8000:8000 ${DEFAULT_IMAGE_NAME}
	else
		docker run -it --net=host -p 8000:8000 ${IMAGE_NAME}
	endif

clean:
	rm -rf src/
