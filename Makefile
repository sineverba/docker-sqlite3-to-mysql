IMAGE_NAME=sineverba/sqlite3-to-mysql
CONTAINER_NAME=sqlite3-to-mysql
VERSION=1.2.0-dev
PYTHON_IMAGE=python:3.11.4-alpine3.18
TOPDIR=$(PWD)

upgrade:
	mkdir req
	docker run --rm -v $(TOPDIR)/req:/usr/src/app \
	$(PYTHON_IMAGE) /bin/sh \
	-c "cd /usr/src/app && pip install --upgrade pip && pip install sqlite3-to-mysql && pip freeze > requirements.txt && cat requirements.txt"
	# Copy requirements
	rm -rf requirements.txt
	cp req/requirements.txt requirements.txt
	rm -rf req/

build:
	docker build --tag $(IMAGE_NAME):$(VERSION) .

test:
	docker run --rm -it --entrypoint cat --name $(CONTAINER_NAME) $(IMAGE_NAME):$(VERSION) /etc/os-release | grep "Alpine Linux v3.18"
	docker run --name $(CONTAINER_NAME) --rm -it $(IMAGE_NAME):$(VERSION) python3 --version | grep "Python 3.11.4"
	docker run --name $(CONTAINER_NAME) --rm -it $(IMAGE_NAME):$(VERSION) sqlite3mysql --version | grep "CPython 3.11.4"
	docker run --name $(CONTAINER_NAME) --rm -it $(IMAGE_NAME):$(VERSION) sqlite3mysql --version | grep "2.0.3"

destroy:
	docker image rm $(IMAGE_NAME):$(VERSION)
	docker image rm $(PYTHON_IMAGE)