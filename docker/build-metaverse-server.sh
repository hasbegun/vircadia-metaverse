#! /bin/bash

if [ -z "$1" ]; then
  C="US"
else
  C=$1
fi

if [ -z "$2" ]; then
  ST="California"
else
  ST=$2
fi

if [ -z "$3" ]; then
  L="San Francisco"
else
  L=$3
fi

if [ -z "$4" ]; then
  O="Vircadia"
else
  O=$4
fi

if [ -z "$5" ]; then
  OU="IT"
else
  OU=$5
fi

if [ -z "$6" ]; then
  CN="innoxai.com"
else
  CN=$6
fi
./keygen.sh "$C" "$ST" "$L" "$O" "$OU" "$CN"

IMAGE_NAME=metaverse-server
# change repo and branch for debug and dev.
REPO=hasbegun
BRANCH=dev_ssl
COMMIT=$(git rev-parse --short HEAD)
echo "Build $IMAGE_NAME based on $COMMIT from $REPO:$BRANCH."

docker build -t $IMAGE_NAME \
  --build-arg=REPO=$REPO \
  --build-arg=BRANCH=$BRANCH \
  --build-arg=COMMIT=$COMMIT \
  -f Dockerfile .
