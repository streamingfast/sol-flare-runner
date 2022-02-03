#!/usr/bin/env bash

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"
mkdir -p ~/app
cp config.yaml ~/app/config.yaml
cp download.sh ~/app/download.sh
cp identity.json ~/app/identity.json
cp start.sh ~/app/start.sh
cp monitor.sh ~/app/monitor.sh

chmod a+x ~/app/download.sh
chmod a+x ~/app/start.sh
chmod a+x ~/app/monitor.sh
