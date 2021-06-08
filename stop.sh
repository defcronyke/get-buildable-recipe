#!/bin/bash
# Stop the Docker container, which has been started using 
# the following script: ./start.sh

get_buildable_recipe_stop() {
  input_str="$@"

  docker stop get_buildable_recipe
}

get_buildable_recipe_stop "$@"
