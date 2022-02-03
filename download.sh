env bash

set -e
TAG="v1.8.x-dm-33abc5ba3-8c293c0-c8c05551ee"

ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )"&& pwd )"

main() {
  pushd "$ROOT" &> /dev/null

    echo "Authenticating docker"
    gcloud auth configure-docker

    echo "Pulling sfsol Image"
    docker pull "gcr.io/eoscanada-shared-services/sf-solana-priv:$TAG"


    echo "Setting up and cleaning bin folder"
    rm -rf bin
    mkdir -p bin

    echo "Running sfsol iamge"
    docker run --name=sfsol  -d "gcr.io/eoscanada-shared-services/sf-solana-priv:$TAG" bash

    echo "Sleeping 5"
    sleep 5

    echo "Copying binaries"
    docker cp sfsol:/app/sfsol ./bin/sfsol
    docker cp sfsol:/app/solana-validator ./bin/solana-validator
    docker cp sfsol:/app/solana-sys-tuner ./bin/solana-sys-tuner

    echo "Stoping Container"
    docker container stop sfsol &> /dev/null
    docker container rm sfsol &> /dev/null

    echo "System Tuning"
    sudo $(command -v solana-sys-tuner) --user $(whoami) > sys-tuner.log 2>&1 &


  popd &> /dev/null
}

main "$@"