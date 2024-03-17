#!/bin/sh

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <path> <filename>"
    exit 1
fi

# Run the command with the provided arguments
dconf dump /$1/ | dconf2nix --root $1 > $2.nix