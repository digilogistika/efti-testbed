#!/bin/bash
set -e

cd ../efti-gate-poc || (echo "Clone the efti-gate-poc repository first" && exit 1)

gates=("eu-ee31" "eu-ee32")

for gate in "${gates[@]}"; do
  echo "***** Deploying $gate ******"
  ./deploy.sh "$gate"
done
echo "***** All gates deployed ******"
