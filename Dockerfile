FROM golang:1.19-bullseye

ARG app_name
ENV APP_NAME ${app_name}

COPY . /go/src/github.com/shitake/${APP_NAME}
WORKDIR /go/src/github.com/shitake/${APP_NAME}

RUN go mod tidy

RUN GOOS=darwin GOARCH=amd64 go build -o ${APP_NAME}_darwin_amd64
RUN GOOS=linux GOARCH=amd64 go build -o ${APP_NAME}_linux_amd64
RUN GOOS=windows GOARCH=amd64 go build -o ${APP_NAME}_windows_amd64.exe