#!/bin/bash

# Service Health Check
echo "🩺 Performing service health check..."

if pgrep cloudflared >/dev/null; then
    echo "✅ Main service: Running"
else
    echo "❌ Main service: Not running"
fi

if pgrep microsocks >/dev/null; then
    echo "✅ Auxiliary service: Running"
else
    echo "❌ Auxiliary service: Not running"
fi

echo "📊 Health check completed"
