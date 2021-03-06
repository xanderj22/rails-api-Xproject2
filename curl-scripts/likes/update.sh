#!/bin/bash

curl --include --request PATCH "http://localhost:4741/likes/${ID}" \
  --header "Content-Type: application/json" \
  # --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "like": {
      "interests": "'"${INTERESTS}"'",
      "five_fave_things": "'"${FIVE_FAVE_THINGS}"'",
      "personality_types": "'"${PERSONALITY_TYPES}"'",
      "gender_prefs": "'"${GENDER_PREFS}"'",
      "searching_for": "'"${SEARCHING_FOR}"'"
    }
  }'

echo
