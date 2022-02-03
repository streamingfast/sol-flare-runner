#!/usr/bin/env bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
mkdir -p ~/app
cp config.yam ~/app/config.yaml
