FROM python:3.8-alpine
MAINTAINER Chimpastic

ENV PYTHONUNBUFFERED 1
RUN apk add --no-cache gcc
RUN apk add musl-dev
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app/

RUN adduser -D user
USER user