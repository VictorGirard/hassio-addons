#!/usr/bin/with-contenv bashio

# ==============================================================================
# Home Assistant Add-on: Chaturbate DVR
# ==============================================================================

bashio::log.info "Starting Chaturbate DVR add-on..."

# Check if username is provided
if ! bashio::config.has_value 'username'; then
    bashio::log.error "Username is required but not set!"
    bashio::exit.nok "Please set a username in the add-on configuration."
fi

# Determine output directory based on configuration
OUTPUT_LOCATION=$(bashio::config 'output_location')
if [ "$OUTPUT_LOCATION" = "custom" ]; then
    if ! bashio::config.has_value 'custom_output_path'; then
        bashio::log.error "Custom output path is required when output_location is set to 'custom'!"
        bashio::exit.nok "Please set a custom_output_path in the add-on configuration."
    fi
    OUTPUT_DIR=$(bashio::config 'custom_output_path')
elif [ "$OUTPUT_LOCATION" = "media" ]; then
    OUTPUT_DIR="/media/chaturbate-dvr"
elif [ "$OUTPUT_LOCATION" = "config" ]; then
    OUTPUT_DIR="/config/chaturbate-dvr"
else
    # Default to share
    OUTPUT_DIR="/share/chaturbate-dvr"
fi

# Create output directory if it doesn't exist
if [ ! -d "$OUTPUT_DIR" ]; then
    bashio::log.info "Creating output directory: $OUTPUT_DIR"
    mkdir -p "$OUTPUT_DIR"
fi

# Validate directory permissions
if [ ! -w "$OUTPUT_DIR" ]; then
    bashio::log.error "Output directory is not writable: $OUTPUT_DIR"
    bashio::exit.nok "Please check the permissions of the output directory."
fi

bashio::log.info "Output directory configured: $OUTPUT_DIR"

bashio::log.info "Chaturbate DVR add-on initialized successfully!"
