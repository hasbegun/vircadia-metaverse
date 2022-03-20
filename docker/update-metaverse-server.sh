echo "==== fetching latest docker image for metaverseserver"
docker pull ghcr.io/vircadia/iamus:latest
echo "==== stopping metaverseserver"
docker stop metaverse-server
echo "==== removing old metaverseserver image"
docker rm metaverse-server
echo "==== starting metaverseserver"
./run-metaverse-server.sh

