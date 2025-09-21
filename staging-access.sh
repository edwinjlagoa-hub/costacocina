#!/bin/bash

# Staging Environment Access Script for La Costa Cocina
# This script helps you access and test the staging environment

echo "🚀 La Costa Cocina - Staging Environment Access"
echo "================================================"
echo ""

# Function to serve staging locally
serve_staging() {
    echo "📥 Checking out staging-site branch..."
    
    # Create a temporary directory for staging
    STAGING_DIR="staging-temp"
    
    if [ -d "$STAGING_DIR" ]; then
        rm -rf "$STAGING_DIR"
    fi
    
    # Clone the staging branch
    git clone --single-branch --branch staging-site https://github.com/edwinjlagoa-hub/lacostacocina.git "$STAGING_DIR"
    
    if [ $? -eq 0 ]; then
        echo "✅ Staging files downloaded successfully!"
        echo ""
        echo "🌐 Starting local server on http://localhost:8000"
        echo "   Press Ctrl+C to stop the server"
        echo ""
        
        cd "$STAGING_DIR"
        
        # Try to serve with Python 3, then Python 2, then Node.js
        if command -v python3 &> /dev/null; then
            python3 -m http.server 8000
        elif command -v python &> /dev/null; then
            python -m SimpleHTTPServer 8000
        elif command -v npx &> /dev/null; then
            npx serve -p 8000
        else
            echo "❌ No suitable server found. Please install Python or Node.js"
            echo "   Manual option: Open index.html in your browser"
        fi
        
        # Cleanup
        cd ..
        rm -rf "$STAGING_DIR"
    else
        echo "❌ Failed to download staging files. Make sure staging branch exists."
    fi
}

# Function to show staging info
show_info() {
    echo "📋 Staging Environment Information:"
    echo ""
    echo "🌐 Staging URL: https://stage.lacostacocina.com"
    echo "🔗 GitHub Branch: https://github.com/edwinjlagoa-hub/lacostacocina/tree/staging-site"
    echo "📁 Local Testing: Run this script with 'serve' option"
    echo "🔄 Auto-Deploy: Pushes to 'develop' branch trigger staging updates"
    echo ""
    echo "⚙️  DNS Setup Required:"
    echo "   Add CNAME record: stage.lacostacocina.com → edwinjlagoa-hub.github.io"
    echo ""
    echo "Commands:"
    echo "  ./staging-access.sh serve    - Download and serve staging locally"
    echo "  ./staging-access.sh info     - Show this information"
    echo ""
}

# Main script logic
case "${1:-info}" in
    "serve")
        serve_staging
        ;;
    "info")
        show_info
        ;;
    *)
        echo "Usage: $0 [serve|info]"
        echo ""
        show_info
        ;;
esac