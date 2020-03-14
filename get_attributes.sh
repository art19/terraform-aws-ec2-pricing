#!/bin/bash

###
# get_attributes.sh
#
# Since Terraform 0.10-0.11 don't have a JSON decoder, we must implement one ourselves using JQ. This is meant to be used as a Terraform external data source
# and follows that protocol.
#
# Requirements:
#
# * JQ must be installed (brew install jq)
###

# Exit if any of the intermediate steps fail
set -e

if ! [[ $(command -v jq) ]]; then
  (>&2 echo "jq not found. Please install jq (brew install jq, apt-get install jq, choco install jq)")
  exit 1
fi

# Extract the product from arguments, strip any CRs
JQ_OUTPUT="$(jq -r '@sh "PRODUCT=\(.product)"')"
eval "${JQ_OUTPUT//$'\r'/}"

# $PRODUCT is the pricing data for the product, but we want the attributes
echo $PRODUCT | jq -c '.product.attributes'
