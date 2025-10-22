ARG BUILD_FROM
FROM yamiodymel/chaturbate-dvr

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install bashio for Home Assistant integration
RUN \
    apk add --no-cache \
        bashio \
        curl \
        jq \
    && \
    mkdir -p /etc/cont-init.d \
    && \
    mkdir -p /etc/services.d/chaturbate-dvr

# Copy root filesystem
COPY rootfs /

# Set up the application
RUN \
    chmod +x /etc/cont-init.d/* \
    && \
    chmod +x /etc/services.d/*/run

# Labels
LABEL \
    io.hass.name="Chaturbate DVR" \
    io.hass.description="Auto records Chaturbate streams when they go online" \
    io.hass.version="2.0.3" \
    io.hass.type="addon" \
    maintainer="victorgirard"
