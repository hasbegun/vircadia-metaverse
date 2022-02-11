#! /bin/bash

CERT=files/cert.pem
KEY=files/key.pem
CHAIN=files/chain.pem

if [ -f "$CERT" ] && [ -f "$KEY" ] && [ -f "$CHAIN" ]; then
  echo "Cert files exist. Skip generation of key."
else
  ./keygen.sh
fi

# docker build -t metaverse-server -f Dockerfile .
