#!/bin/bash
envsubst < /opt/hortonworks-registry-0.3.0/conf/registry.yaml.template > /opt/hortonworks-registry-0.3.0/conf/registry.yaml
./wait-for-it.sh $DB_HOST:$DB_PORT --strict -- ./bootstrap/bootstrap-storage.sh create
exec "$@"
