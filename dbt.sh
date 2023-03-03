#!/bin/bash

# docker pull ghcr.io/dbt-labs/dbt-snowflake:1.4.0

docker run \
--network=host \
--mount type=bind,source=${PWD},target=/usr/app \
--mount type=bind,source=${PWD}/profiles.yml,target=/root/.dbt/profiles.yml \
--mount type=bind,source=${PWD}/secrets,target=/usr/secrets \
ghcr.io/dbt-labs/dbt-snowflake:1.4.0 \
"$@"