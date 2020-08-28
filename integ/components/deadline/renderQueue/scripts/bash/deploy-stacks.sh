#!/bin/bash
#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

if [ $EXECUTE_DEADLINE_RENDERQ_TEST_SUITE = true ]; then
  echo "Deploying test app for Deadline Renderqueue test suite..."
  npx cdk deploy "*" --require-approval=never
  echo "Test app deployed."
fi
