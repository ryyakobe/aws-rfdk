#!/bin/bash
#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

if [ $EXECUTE_DEADLINE_RENDERQ_TEST_SUITE == true ]; then

  # Get the directory in which this script is located
  SOURCE="${BASH_SOURCE[0]}"
  while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  done
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

  # Deploy a test app using the first configuration, run all jest tests, then tear the app down
  echo "Running Deadline RenderQueue end-to-end test..."
  $DIR/deploy-stacks.sh
  $DIR/run-tests.sh
  $DIR/destroy-stacks.sh
  echo "Deadline RenderQueue tests complete."
fi
