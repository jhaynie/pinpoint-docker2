#!/bin/bash

set -e

PWD=`pwd`

cd ../pinpoint-fetcher
gulp docker:build

cd ../pinpoint-db
gulp docker:build

cd ../pinpoint-processor
gulp docker:build

cd $PWD
