#!/usr/bin/env bash

PASSWORD="1234567890"
ADDR="cosmos16xyempempp92x9hyzz9wrgf94r6j9h5f06pxxv"
CHAIN="lcd"
GOVID="2"

# luckily governance are down in the swagger sequence of calls, this 15s are massive sleep time
# TODO: find out why the signature verification still fails without sleeps
# 3 seconds works sometims, 4 seconds often, 5 always but is huge!
sleep 5s
echo ${PASSWORD} | ./build/gaiacli tx gov submit-proposal --home contract_tests --from ${ADDR} --chain-id ${CHAIN} --type text --title test --description test_description --deposit 10000stake --yes
sleep 5s
echo ${PASSWORD} | ./build/gaiacli tx gov deposit --home contract_tests --from ${ADDR} --chain-id ${CHAIN} ${GOVID} 1000000000stake --yes
sleep 5s
echo ${PASSWORD} | ./build/gaiacli tx gov vote --home contract_tests --from ${ADDR} --yes --chain-id ${CHAIN} ${GOVID} Yes