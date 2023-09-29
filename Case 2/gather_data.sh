#!/bin/bash

# replicas=(1 5 10 20 50 100)
replicas=(200 300 500)

for amount in ${replicas[@]}; do
    echo starting $amount client containers

    export CLIENT_REPLICAS=$amount
    docker compose up -d
    SECONDS=0
    while (( SECONDS < 125 )); do
        docker stats --no-stream | cat >> logs_${amount}.csv
    done
    docker compose down
done

echo -e "\a"
