IMAGE_NAME=nekonomicon-dev
CONTAINER_NAME=neko-dev
APP_NAME=nekonomicon

docker build --no-cache \
  -t ${IMAGE_NAME} \
  --build-arg app_name=${APP_NAME} \
  -f dev.Dockerfile \
  .

docker run \
  --name ${CONTAINER_NAME} \
  -itd \
  -v $(pwd):/go/src/github.com/shitake/${APP_NAME} \
  -w /go/src/github.com/shitake/${APP_NAME} \
  ${IMAGE_NAME} \
  bash