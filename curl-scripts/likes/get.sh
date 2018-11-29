#!/bin/bash

curl "http://localhost:4741/likes" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
