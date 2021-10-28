FROM python:3.10.0-alpine3.14

RUN apk update && apk upgrade

WORKDIR /usr/src/app

RUN pip install --upgrade pip

COPY ./requirements.txt /usr/src/app/requirements.txt

RUN pip install -r requirements.txt