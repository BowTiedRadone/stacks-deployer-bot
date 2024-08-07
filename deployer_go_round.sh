#!/bin/bash

# Define the path to your TypeScript script
SCRIPT_PATH="index.ts"

# Define the command to run the TypeScript script
RUN_COMMAND="npx ts-node $SCRIPT_PATH"

echo "Starting deployment..."

# Run the script in a loop
while true; do
  # Execute the TypeScript script
  $RUN_COMMAND

  # Check the exit status of the script
  if [ $? -ne 0 ]; then
    echo "Script encountered an error. Exiting..."
    exit 1
  fi
done
