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
  CN="IT"
else
  CN=$6
fi

# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout server.key -out server.crt
KEY=files/privkey.pem
CERT=files/cert.pem
CHAIN=files/chain.pem

openssl req -x509 -newkey rsa:4096 \
    -keyout $KEY -nodes -out $CERT -sha256 -days 365 \
    -subj "/C=$C/ST=$ST/L=$L/O=$O/OU=$OU/CN=$CN"

cp $KEY $CHAIN
cat $CERT >> $CHAIN

echo "Country: $C, State: $ST, City: $L, Org: $O, Dept: $OU, CN=$CN"
echo "Key file: $KEY, Cert file: $CERT, Cahin: $CHAIN"