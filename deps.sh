#!/bin/bash
# Build the Docker dependencies image.
#
# NOTE: You have to run this script once first, 
# and afterwards you have to run the following 
# script to build the production Docker 
# image: ./prod.sh

get_buildable_recipe_deps() {
  input_str="$@"

  docker build -t get_buildable_recipe_deps:latest -f deps/Dockerfile .
}

get_buildable_recipe_deps "$@"
