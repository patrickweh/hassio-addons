#!/usr/bin/with-contenv bashio
export WIBUTLER_HOST=$(bashio::config "wibutler_host")
export WIBUTLER_PASSWORD=$(bashio::config "wibutler_password")
export WIBUTLER_USERNAME=$(bashio::config "wibutler_username")

export MQTT_HOST=$(bashio::services mqtt "host")
export MQTT_AUTH_PASSWORD=$(bashio::services mqtt "password")
export MQTT_AUTH_USERNAME=$(bashio::services mqtt "username")
export MQTT_PORT=$(bashio::services mqtt "port")

set -e

# Trap any exit signals (including errors in background processes)
trap 'exit 1' ERR

# Start the first PHP command in the background
php83 /opt/wibutler-websocket-mqtt websocket:listen &

# Start the second PHP command in the background (example command here)
php83 /opt/wibutler-websocket-mqtt mqtt:listen &

# Wait for all background jobs to finish
wait
