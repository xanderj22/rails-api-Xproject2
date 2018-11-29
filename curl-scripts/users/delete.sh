#!/bin/bash

curl --include --request DELETE "http://localhost:4741/users/${ID}"
# --header "Authorization: Token token=${TOKEN}" \
