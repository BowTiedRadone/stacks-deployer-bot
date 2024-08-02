#!/bin/bash

# Define the path to your TypeScript script
SCRIPT_PATH="index.ts"

# Define the command to run the TypeScript script
RUN_COMMAND="npx ts-node $SCRIPT_PATH"

# Run the script in a loop
while true; do
  echo "Starting deployment..."

  # Execute the TypeScript script
  $RUN_COMMAND

  # Check the exit status of the script
  if [ $? -ne 0 ]; then
    echo "Script encountered an error. Exiting..."
    exit 1
  fi

  echo "All contracts deployed. Restarting script in 1 minute..."

  # Wait for 1 minute before restarting
  sleep 60
done
