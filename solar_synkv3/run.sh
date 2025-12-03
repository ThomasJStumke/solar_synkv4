#!/usr/bin/with-contenv bashio
set -e

while true; do
  sunsynk_user="$(bashio::config 'sunsynk_user')"
  sunsynk_pass="$(bashio::config 'sunsynk_pass')"
  sunsynk_serial="$(bashio::config 'sunsynk_serial')"
  HA_LongLiveToken="$(bashio::config 'HA_LongLiveToken')"
  Home_Assistant_IP="$(bashio::config 'Home_Assistant_IP')"
  Home_Assistant_PORT="$(bashio::config 'Home_Assistant_PORT')"
  Refresh_rate="$(bashio::config 'Refresh_rate')"
  Enable_HTTPS="$(bashio::config 'Enable_HTTPS')"
  API_Server="$(bashio::config 'API_Server')"
  use_internal_api="$(bashio::config 'use_internal_api')"

  bashio::log.info "SolarSynkV3 cycle start (refresh=${Refresh_rate}s, HA=${Home_Assistant_IP}:${Home_Assistant_PORT}, https=${Enable_HTTPS}, api=${API_Server}, internal_api=${use_internal_api})"

  python3 /main.py

  bashio::log.info "Cycle complete. Sleeping ${Refresh_rate}s..."
  sleep "${Refresh_rate}"
done
