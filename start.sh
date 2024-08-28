#!/bin/bash
./config.sh --unattended --url $GH_RUNNER_URL --token $GH_RUNNER_TOKEN --replace --name $GH_RUNNER_NAME --labels $GH_RUNNER_LABELS
./run.sh