IMAGE_NAME=sineverba/sqlite3-to-mysql
CONTAINER_NAME=sqlite3-to-mysql
VERSION=1.1.0-dev
PYTHON_IMAGE=python:3.11.1-alpine3.17
TOPDIR=$(PWD)

showupgrade:
	docker run --rm -v $(TOPDIR)/req:/usr/src/app \
	$(PYTHON_IMAGE) /bin/sh \
	-c "cd /usr/src/app && pip install --upgrade pip && pip install sqlite3-to-mysql && pip freeze > requirements.txt && cat requirements.txt"

build:
	docker build --tag $(IMAGE_NAME):$(VERSION) .

test:
	docker run --rm -it --entrypoint cat --name $(CONTAINER_NAME) $(IMAGE_NAME):$(VERSION) /etc/os-release | grep "Alpine Linux v3.17"
	docker run --name $(CONTAINER_NAME) --rm -it $(IMAGE_NAME):$(VERSION) python3 --version | grep "Python 3.11.1"
	docker run --name $(CONTAINER_NAME) --rm -it $(IMAGE_NAME):$(VERSION) sqlite3mysql --version | grep "CPython 3.11.1"
	docker run --name $(CONTAINER_NAME) --rm -it $(IMAGE_NAME):$(VERSION) sqlite3mysql --version | grep "1.4.16"

destroy:
	docker image rm $(IMAGE_NAME):$(VERSION)