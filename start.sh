#!/bin/bash
# Check for .credentials and .runner on .store folder and copy them if exists
if [ -f /actions-runner/.store/.credentials ]; then
    cp /actions-runner/.store/.credentials .
fi
if [ -f /actions/runner/.store/.runner ]; then
    cp /actions-runner/.store/.runner .
fi

./config.sh --unattended --url $GH_RUNNER_URL --token $GH_RUNNER_TOKEN --replace --name $GH_RUNNER_NAME --labels $GH_RUNNER_LABELS

# Copy credentials and runner to .store folder
cp .credentials /actions-runner/.store
cp .runner /actions-runner/.store

./run.sh