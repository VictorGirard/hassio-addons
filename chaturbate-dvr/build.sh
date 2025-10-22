#!/bin/bash

# Build script for Chaturbate DVR Home Assistant Add-on
# This script builds the Docker images for all supported architectures

set -e

# Configuration
ADDON_NAME="chaturbate-dvr"
VERSION="2.0.3"
REGISTRY="ghcr.io/victorgirard"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Building Chaturbate DVR Home Assistant Add-on${NC}"
echo -e "${GREEN}Version: ${VERSION}${NC}"
echo -e "${GREEN}Registry: ${REGISTRY}${NC}"
echo ""

# Check if we're in the right directory
if [ ! -f "Dockerfile" ]; then
    echo -e "${RED}Error: Dockerfile not found. Please run this script from the addon directory.${NC}"
    exit 1
fi

# Build for each architecture
ARCHITECTURES=("aarch64" "amd64" "armv7")

for arch in "${ARCHITECTURES[@]}"; do
    echo -e "${YELLOW}Building for architecture: ${arch}${NC}"
    
    # Build the image
    docker build \
        --build-arg BUILD_FROM="ghcr.io/home-assistant/${arch}-base:latest" \
        --build-arg BUILD_ARCH="${arch}" \
        --build-arg CHATURBATE_DVR_VERSION="${VERSION}" \
        --tag "${REGISTRY}/${arch}-${ADDON_NAME}:${VERSION}" \
        --tag "${REGISTRY}/${arch}-${ADDON_NAME}:latest" \
        .
    
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}✓ Successfully built ${arch}-${ADDON_NAME}:${VERSION}${NC}"
    else
        echo -e "${RED}✗ Failed to build ${arch}-${ADDON_NAME}:${VERSION}${NC}"
        exit 1
    fi
done

echo ""
echo -e "${GREEN}All images built successfully!${NC}"
echo ""
echo "To push the images to the registry, run:"
echo "docker push ${REGISTRY}/aarch64-${ADDON_NAME}:${VERSION}"
echo "docker push ${REGISTRY}/amd64-${ADDON_NAME}:${VERSION}"
echo "docker push ${REGISTRY}/armv7-${ADDON_NAME}:${VERSION}"
echo ""
echo "Or push all at once:"
echo "docker push --all-tags ${REGISTRY}/"
