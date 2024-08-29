#!/bin/bash
# Copy from .store folder if the files exists to avoid reconfiguring the runner
cp -a /actions-runner/.store/. /actions-runner/

./config.sh --unattended --url $GH_RUNNER_URL --token $GH_RUNNER_TOKEN --replace --name $GH_RUNNER_NAME --labels $GH_RUNNER_LABELS

# Copy to .store folder to avoid reconfiguring the runner
cp .credentials /actions-runner/.store/.credentials
cp .credentials_rsaparams /actions-runner/.store/.credentials_rsaparams
cp .runner /actions-runner/.store/.runner
cp .path /actions-runner/.store/.path
cp .env /actions-runner/.store/.env
cp svc.sh /actions-runner/.store/svc.sh
cp -r _diag /actions-runner/.store/_diag

./run.sh