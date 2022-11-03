IMAGE_NAME=nekonomicon
CONTAINER_NAME=neko
APP_NAME=nekonomicon

docker build --no-cache \
  -t ${IMAGE_NAME} \
  --build-arg app_env=dev \
  --build-arg app_name=${APP_NAME} \
  .

docker run \
  --name ${CONTAINER_NAME} \
  -itd \
  -v $(pwd):/go/src/github.com/shitake/${APP_NAME} \
  -w /go/src/github.com/shitake/${APP_NAME} \
  ${IMAGE_NAME} \
  bash