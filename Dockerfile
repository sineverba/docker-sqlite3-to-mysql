FROM python:3.10.0-alpine3.14

RUN apk update && apk upgrade

# set working directory
WORKDIR /usr/src/app

# add and install requirements
RUN pip install --upgrade pip sqlite3-to-mysql