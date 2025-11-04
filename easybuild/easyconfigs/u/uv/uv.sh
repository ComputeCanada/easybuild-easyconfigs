#!/bin/bash

UV_BIN=".exe"

# Take all arguments, remove --no-config, collapse spaces, trim edges
FILTERED_ARGS=$(echo "$@" | sed -e 's/--no-config//')

# Call uv with the cleaned arguments
exec "$UV_BIN" $FILTERED_ARGS

