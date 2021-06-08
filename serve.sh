#!/bin/bash
# Serve the web application directly (without Docker).
# Use this script during development.
#
# NOTE: Run this once first: cargo install cargo-watch

get_buildable_recipe_serve() {
  input_str="$@"

  CARGO_WATCH_ARGS="-w src/ -w Cargo.toml -x run"

  cargo watch $CARGO_WATCH_ARGS

  if [ $? -ne 0 ]; then
    cargo install cargo-watch

    cargo watch $CARGO_WATCH_ARGS
  fi
}

get_buildable_recipe_serve "$@"
