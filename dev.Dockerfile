FROM golang:1.19-bullseye

ARG app_name

ENV APP_NAME ${app_name}

COPY . /go/src/github.com/shitake/${APP_NAME}
WORKDIR /go/src/github.com/shitake/${APP_NAME}
