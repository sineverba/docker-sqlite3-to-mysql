TOPDIR=$(PWD)
PYTHON_IMAGE=python:3.10.2-alpine3.15
IMAGE_NAME=sineverba/testdockersqlite3tomysql
CONTAINER_NAME=testdockersqlite3tomysql

requirements:
	docker run --rm -v $(TOPDIR)/req:/usr/src/app \
	$(PYTHON_IMAGE) /bin/sh \
	-c "cd /usr/src/app && pip install --upgrade pip && pip install sqlite3-to-mysql && pip freeze > requirements.txt"

build:
	docker build --tag $(IMAGE_NAME) .

test:
	docker run --name $(CONTAINER_NAME) --rm -it $(IMAGE_NAME) python3 --version | grep "Python 3.10.2"
	docker run --name $(CONTAINER_NAME) --rm -it $(IMAGE_NAME) sqlite3mysql --version | grep "CPython 3.10.2"
	docker run --name $(CONTAINER_NAME) --rm -it $(IMAGE_NAME) sqlite3mysql --version | grep "1.4.9"

destroy:
	docker image rm $(IMAGE_NAME)