#!/bin/bash

# Set the commit message file
INPUT_FILE="${1:-.git/COMMIT_EDITMSG}"
START_LINE=$(head -n1 "$INPUT_FILE")

# Define the regex pattern for conventional commits
PATTERN="^(feat|fix|docs|style|refactor|test|chore)(\([a-zA-Z0-9_-]+\))?: .+"

echo "START_LINE: $START_LINE"

# Check if the start line matches the conventional commit pattern
if ! [[ "$START_LINE" =~ $PATTERN ]]; then
  echo "Bad commit message, see example: feat: add new feature"
  exit 1
fi

# If the commit message is valid, exit with success code
exit 0
