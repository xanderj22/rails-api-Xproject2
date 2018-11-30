#!/bin/bash

curl --include --request DELETE "http://localhost:4741/likes/${ID}"
# --header "Authorization: Token token=${TOKEN}" \
