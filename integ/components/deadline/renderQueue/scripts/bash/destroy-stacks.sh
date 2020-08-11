#!/bin/bash
#
# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX-License-Identifier: Apache-2.0

set -euo pipefail

if [ $EXECUTE_DEADLINE_RENDERQ_TEST_SUITE = true ]; then
  npx cdk destroy "*" -f
fi
