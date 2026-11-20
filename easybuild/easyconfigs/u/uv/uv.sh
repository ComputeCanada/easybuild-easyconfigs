#!/bin/bash

UV_BIN=".exe"

# Check if --no-config is present
if [[ " $* " == *" --no-config "* ]]; then
    echo "Warning: '--no-config' was provided but will be ignored."
fi

# Take all arguments, remove --no-config, collapse spaces, trim edges
FILTERED_ARGS=$(echo "$@" | sed -e 's/--no-config//')

# Call uv with the cleaned arguments
exec "$UV_BIN" $FILTERED_ARGS
