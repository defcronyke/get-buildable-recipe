#!/bin/bash
# Build the Docker image for the container.
#
# NOTE: You have to run this script once first, 
# and afterwards you can run the following 
# script to start the container: ./start.sh

get_buildable_recipe_prod() {
  input_str="$@"

  docker build -t gcr.io/get-buildable-recipe/get_buildable_recipe:latest .
}

get_buildable_recipe_prod "$@"
