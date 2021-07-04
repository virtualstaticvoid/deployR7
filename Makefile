IMAGE_REPO ?= virtualstaticvoid/deployr7-example
BASE_IMAGE := app-base
APP_IMAGE := app

# default build target
all::

.PHONY: all
all:: build

renv.lock:

	# only rebuild the base image if renv.lock changes

	docker build --tag $(IMAGE_REPO):$(BASE_IMAGE) --file Dockerfile.base .

.PHONY: build
build: renv.lock

	docker build \
		--build-arg BASE_IMAGE=$(IMAGE_REPO):$(BASE_IMAGE) \
		--tag $(IMAGE_REPO):$(APP_IMAGE) .

.PHONY: publish
publish:

	# publish image to a remote repository (such as Docker Hub)
	# which is accessible to Heroku for use during deployment (git push)

	docker push $(IMAGE_REPO):$(BASE_IMAGE)

	# see also https://devcenter.heroku.com/articles/container-registry-and-runtime for alternatives

.PHONY: run
run:

	docker run -it -p "8080:8080" $(IMAGE_REPO):$(APP_IMAGE)

.PHONY: test
test:

	@curl -v "localhost:8080/echo?msg=Hello%20World!"
	@curl -v -d "a=10" -d "b=2" localhost:8080/sum
	@curl -v "http://localhost:8080/plot" -o plot.png
