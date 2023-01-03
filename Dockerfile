FROM python:3.11.1-alpine3.17

RUN apk update && apk upgrade

WORKDIR /usr/src/app

RUN pip install --upgrade pip

COPY ./requirements.txt /usr/src/app/requirements.txt

RUN pip install -r requirements.txt