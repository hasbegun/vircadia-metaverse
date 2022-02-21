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
  CN="metaverse.innoxai.com"
else
  CN=$6
fi
DOMAIN=metaverse.$CN
KEY=files/metaverse.key
CRT=files/metaverse.crt

if [ ! -f $KEY ] || [ ! -f $CRT ]; then
openssl req -x509 -nodes -days 365 \
  -newkey rsa:4096 \
  -subj "/C=$C/ST=$ST/L=$L/O=$O/OU=$OU/CN=$DOMAIN" \
  -addext "subjectAltName=DNS:$CN" \
  -keyout $KEY \
  -out $CRT
fi
echo "Your key and cert can be found at files dir."
echo "Country: $C, State: $ST, City: $L, Org: $O, Dept: $OU, CN=$DOMAIN"
echo "Key file: $KEY, Cert file: $CERT"
