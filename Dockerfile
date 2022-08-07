FROM python:3.8-alpine
MAINTAINER Chimpastic

ENV PYTHONUNBUFFERED 1
RUN apk add --no-cache gcc
RUN apk add musl-dev
COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client

RUN apk add --update --no-cache --virtual .tmp-build-deps \
    libc-dev linux-headers postgresql-dev


RUN pip install -r /requirements.txt

RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app/

RUN adduser -D user
USER user