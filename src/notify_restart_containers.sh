#!/usr/bin/env bash
#
# Detiene y reinicia todos los contenedores de Docker y notifica a Healthchecks.io

function notify_healthchecks {
  curl \
    --fail \
    --max-time 10 \
    --output /dev/null \
    --retry 5 \
    --show-error \
    --silent \
    https://hc-ping.com/{$1}
}

notify_healthchecks d2ddbf3d-323b-4fda-9fa7-6e8c49eb2e1d/start && \
${HOME}/src/stop_containers && \
echo "OK: stop_containers" >> ${LOG} \
|| echo "ERROR: stop_containers" >> ${LOG} && \
${HOME}/src/start_containers && \
notify_healthchecks d2ddbf3d-323b-4fda-9fa7-6e8c49eb2e1d \
|| echo "ERROR: start_containers" >> ${LOG} && \
echo "" >> ${LOG}
