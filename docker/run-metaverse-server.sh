#! /bin/bash
# Start the metaverseserver with persistant data in local dir

BASE=$(pwd)
cd "${BASE}"

DVERSION=latest

# remote image
# IMG_NAME=ghcr.io/vircadia/iamus
IMG_NAME=metaverseserver

docker run -d \
    --name=metaverse-server \
    --restart=unless-stopped \
    -p 9400:9400 \
    -e IAMUS_CONFIG_FILE=/home/cadia/config/iamus.json \
    --volume ${BASE}/config:/home/cadia/config \
    ${IMG_NAME}:${DVERSION}

    # --network="host" \
