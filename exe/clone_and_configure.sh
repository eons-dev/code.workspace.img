#!/bin/bash

# Extract the Git URL passed via APP_ARGS
GIT_URL="${APP_ARGS}"

# Check if a Git URL was provided
if [ -n "$GIT_URL" ]; then
    echo "Cloning repository: $GIT_URL"
    git clone $GIT_URL $HOME/workspace

    echo "Configuring workspace"
    cd $HOME/workspace

    if [ -f ./.devrc ]; then
        echo "Running .devrc"
        chmod +x ./.devrc
        ./.devrc
    else
        echo "No .devrc file found."
    fi
else
    echo "No Git URL provided. Starting default workspace."
fi