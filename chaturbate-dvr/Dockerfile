ARG BUILD_FROM
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
ARG BUILD_ARCH
ARG CHATURBATE_DVR_VERSION=2.0.3

# Install system dependencies
RUN \
    apk add --no-cache \
        curl \
        wget \
        ffmpeg \
        ca-certificates \
    && \
    # Download and install chaturbate-dvr
    case "${BUILD_ARCH}" in \
        aarch64) ARCH="arm64" ;; \
        amd64) ARCH="amd64" ;; \
        armv7) ARCH="arm" ;; \
    esac \
    && \
    curl -L -o /usr/local/bin/chaturbate-dvr \
        "https://github.com/teacat/chaturbate-dvr/releases/download/v${CHATURBATE_DVR_VERSION}/chaturbate-dvr_${CHATURBATE_DVR_VERSION}_linux_${ARCH}.tar.gz" \
    && \
    tar -xzf /usr/local/bin/chaturbate-dvr -C /usr/local/bin/ \
    && \
    rm /usr/local/bin/chaturbate-dvr \
    && \
    chmod +x /usr/local/bin/chaturbate-dvr

# Copy root filesystem
COPY rootfs /

# Set up the application
RUN \
    mkdir -p /app \
    && \
    chmod +x /etc/cont-init.d/* \
    && \
    chmod +x /etc/services.d/*/run

# Labels
LABEL \
    io.hass.name="Chaturbate DVR" \
    io.hass.description="Auto records Chaturbate streams when they go online" \
    io.hass.version="${CHATURBATE_DVR_VERSION}" \
    io.hass.type="addon" \
    io.hass.arch="${BUILD_ARCH}" \
    maintainer="victorgirard"
