#!/bin/bash
# Get Buildable recipe details in JSON format.

get_buildable_recipe_usage() {
  echo "Usage: ${BASH_SOURCE[0]} <recipe_id> '<access_token>'"
}

get_buildable_recipe() {
  creds_file="./creds.env"

  source "$creds_file"
  source_res=$?
  if [ $source_res -ne 0 ]; then
    get_buildable_recipe_usage
    return $source_res
  fi

  if [ $# -lt 2 ]; then
    get_buildable_recipe_usage
    return 1
  else
    GET_BUILDABLE_RECIPE_AUTH_KEY="$2"
  fi

  # if [ $# -lt 2 ]; then
  #   get_buildable_recipe_usage
  #   return 2
  # else
  #   recipe_url="$2"
  # fi

  if [ $# -lt 1 ]; then
    get_buildable_recipe_usage
    return 3
  else
    recipe_id="$(printf '%s' "$1" | awk -F'/' '{print $NF}')"
  fi

  curl -sL -H 'Content-Type: application/json;charset=utf-8' -H "Authorization: $GET_BUILDABLE_RECIPE_AUTH_KEY" -H 'Referrer: https://app.buildable.dev/' -H 'Origin: https://app.buildable.dev' -H 'Host: api.buildable.dev' -H 'TE: Trailers' -H 'Accept: application/json, text/plain, */*' -d '{"id":"'$recipe_id'"}' "https://api.buildable.dev/trigger/v2/$GET_BUILDABLE_RECIPE_URL"
}

get_buildable_recipe "$@"
