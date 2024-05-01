#!/usr/bin/with-contenv bashio
export POWER_DOG_HOST=$(bashio::config "power_dog_host")
export POWER_DOG_PASSWORD=$(bashio::config "power_dog_password")

export MQTT_HOST=$(bashio::services mqtt "host")
export MQTT_AUTH_PASSWORD=$(bashio::services mqtt "password")
export MQTT_AUTH_USERNAME=$(bashio::services mqtt "username")
export MQTT_PORT=$(bashio::services mqtt "port")

set -e

# Trap any exit signals (including errors in background processes)
trap 'exit 1' ERR

# Start the first PHP command in the background
php83 /opt/power-dog-mqtt run &

# Wait for all background jobs to finish
wait
