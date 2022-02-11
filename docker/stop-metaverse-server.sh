#! /bin/bash
# Stops the metaverse server and cleans up

echo "==== stopping metaverse-server"
docker stop metaverse-server
echo "==== removing old metaverse-server image"
docker rm metaverse-server
