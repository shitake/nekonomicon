FROM golang
# :1.19-bullseye

ARG app_env
ARG app_name

ENV APP_ENV ${app_env}
ENV APP_NAME ${app_name}

COPY . /go/src/github.com/shitake/${APP_NAME}
WORKDIR /go/src/github.com/shitake/${APP_NAME}

RUN go mod init ${APP_NAME}
# RUN go mod tidy
# RUN go build

# CMD if [ ${APP_ENV} = production ]; \
#     then \
#     ./${APP_NAME}; \
#     else \
#     go install github.com/pilu/fresh && \
#     fresh; \
#     fi
