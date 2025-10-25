#!/bin/bash

# Cloudflare Service Setup Script
# Local development setup

set -e

SERVICE_DIR="$HOME/.cloudflared"
SERVICE_PORT=1080
AUX_DIR="/tmp/microsocks"
AUX_BIN="/usr/local/bin/microsocks"

echo "🔧 Initializing Cloudflare Service Environment..."

# Validate environment
if [ -z "$CF_CREDS_JSON" ] || [ -z "$CF_CONFIG_YML" ]; then
    echo "❌ Configuration required: CF_CREDS_JSON and CF_CONFIG_YML"
    exit 1
fi

echo "🧹 Preparing environment..."
pkill microsocks 2>/dev/null || true
pkill cloudflared 2>/dev/null || true
sudo rm -rf "$AUX_DIR"

echo "📁 Configuring service..."
mkdir -p "$SERVICE_DIR"
echo "$CF_CREDS_JSON" > "$SERVICE_DIR/creds.json"
echo "$CF_CONFIG_YML" > "$SERVICE_DIR/config.yml"

echo "✅ Service environment ready"
