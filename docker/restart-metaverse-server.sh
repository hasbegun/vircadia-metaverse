echo "==== stopping metaverseserver"
docker stop metaverse-server
echo "==== removing old metaverseserver image"
docker rm metaverse-server
echo "==== starting metaverseserver"
./run-metaverse-server.sh

