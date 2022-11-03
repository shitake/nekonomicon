IMAGE_NAME=nekonomicon
CONTAINER_NAME=neko
APP_NAME=nekonomicon

docker build --no-cache \
  -t ${IMAGE_NAME} \
  --build-arg app_name=${APP_NAME} \
  -f Dockerfile \
  .
docker create --name ${CONTAINER_NAME} -it ${IMAGE_NAME} bash
docker cp ${CONTAINER_NAME}:/go/src/github.com/shitake/${APP_NAME}/${APP_NAME}_darwin_amd64 .
docker cp ${CONTAINER_NAME}:/go/src/github.com/shitake/${APP_NAME}/${APP_NAME}_linux_amd64 .
docker cp ${CONTAINER_NAME}:/go/src/github.com/shitake/${APP_NAME}/${APP_NAME}_windows_amd64.exe .
docker rm -f ${CONTAINER_NAME}