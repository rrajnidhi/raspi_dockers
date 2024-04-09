IMAGE_NAME=nidhi_ros

docker build --no-cache `dirname $0` -t $IMAGE_NAME --network host --rm=false --progress=plain
