#! /bin/bash

KEY=files/privkey.pem
CERT=files/cert.pem
CHAIN=files/chain.pem

if [ -f "$CERT" ] && [ -f "$KEY" ] && [ -f "$CHAIN" ]; then
  echo "Cert files exist. Skip the key and the cert generation."
else
  ./keygen.sh
fi

docker build -t metaverse-server -f Dockerfile .
