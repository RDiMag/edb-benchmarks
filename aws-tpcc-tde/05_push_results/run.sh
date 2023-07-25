#!/bin/bash -eux
# Push DBT2 files to the S3 bucket
date=$(date +'%Y-%m-%dT%H:%M:%S')

# Upload benchmark data
RESULTS_DIRECTORY="${SOURCEDIR}/../results"
aws s3 cp "$RESULTS_DIRECTORY/" "s3://${BUCKET_NAME}/${BENCHMARK_NAME}/${date}/" --recursive
