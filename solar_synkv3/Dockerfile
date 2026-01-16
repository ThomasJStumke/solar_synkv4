ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base-python:3.12-alpine
FROM ${BUILD_FROM}

LABEL \
  io.hass.name="SolarSynkV4" \
  io.hass.description="SolarSynk V4 Add-on" \
  io.hass.arch="amd64" \
  io.hass.type="addon" \
  maintainer="Thomas Stumke"

# Alpine already has python — only install extras
RUN apk add --no-cache \
    py3-requests \
    py3-cryptography

WORKDIR /data

COPY run.sh /
COPY main.py /
COPY getapi.py /
COPY gettoken.py /
COPY postapi.py /
COPY settingsmanager.py /
COPY src/ /src/

RUN chmod +x /run.sh

CMD ["/run.sh"]
