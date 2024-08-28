#!/bin/bash
# Check for .credentials and .runner on .store folder and copy them if exists
if [ -f /home/alber/.store/.credentials ]; then
    cp /home/alber/.store/.credentials .
fi
if [ -f /home/alber/.store/.runner ]; then
    cp /home/alber/.store/.runner .
fi

./config.sh --unattended --url $GH_RUNNER_URL --token $GH_RUNNER_TOKEN --replace --name $GH_RUNNER_NAME --labels $GH_RUNNER_LABELS

# Copy credentials and runner to .store folder
cp .credentials /home/alber/.store/
cp .runner /home/alber/.store/

./run.sh