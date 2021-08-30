FROM python:3.10.0rc1-alpine

WORKDIR /usr/src/app

COPY . .

RUN pip install -r requirements.txt

