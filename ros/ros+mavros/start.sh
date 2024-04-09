# Based on:
# http://wiki.ros.org/docker/Tutorials/GUI


IMAGE_NAME=nidhi_ros


xhost +local:root > /dev/null

docker run -it --rm \
    --privileged \
    --env="DISPLAY" \
    --workdir="/app" \
    --volume="/home:/app" \
    --volume="/dev:/dev" \
    --network host \
    $IMAGE_NAME \
    "$@"

xhost -local:root > /dev/null
 
