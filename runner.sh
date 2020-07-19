#!/usr/bin/env bash

set -eux

run_test() {
    VERSION=$1
    OS=$2
    TEST_ID=${VERSION}-${OS}-optimized
    docker build -t semantic:${TEST_ID} -f ${VERSION}/${OS}/Dockerfile .
    docker run -it -e TEST_ID=${TEST_ID} -v `pwd`:/app semantic:${TEST_ID} /app/test.sh

    TEST2_ID=${VERSION}-${OS}
    docker run -it -e TEST_ID=${TEST2_ID} -v `pwd`:/app python:${TEST2_ID} /app/test.sh
}


run_test 3.8 alpine3.12
run_test 3.8 buster
run_test 3.7 alpine3.12
run_test 3.7 buster
