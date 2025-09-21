#!/bin/bash

# Local Testing Script for La Costa Cocina
# This script helps you test changes locally before deploying to production

echo "🏠 La Costa Cocina - Local Testing"
echo "=================================="
echo ""

# Function to serve locally
serve_local() {
    echo "📥 Downloading latest develop branch for local testing..."
    
    # Create a temporary directory for local testing
    LOCAL_DIR="local-testing"
    
    if [ -d "$LOCAL_DIR" ]; then
        rm -rf "$LOCAL_DIR"
    fi
    
    # Clone the develop branch
    git clone --single-branch --branch develop https://github.com/edwinjlagoa-hub/lacostacocina.git "$LOCAL_DIR"
    
    if [ $? -eq 0 ]; then
        echo "✅ Files downloaded successfully!"
        echo ""
        echo "🌐 Starting local server on http://localhost:8000"
        echo "   Press Ctrl+C to stop the server"
        echo ""
        
        cd "$LOCAL_DIR"
        
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
        rm -rf "$LOCAL_DIR"
    else
        echo "❌ Failed to download files. Please check your internet connection."
    fi
}

# Function to show info
show_info() {
    echo "📋 Local Testing Information:"
    echo ""
    echo "🌐 Production URL: https://lacostacocina.com"
    echo "🔗 GitHub Repository: https://github.com/edwinjlagoa-hub/lacostacocina"
    echo "📁 Local Testing: Run this script with 'serve' option"
    echo "🔄 Workflow: develop locally → test locally → deploy to production"
    echo ""
    echo "Commands:"
    echo "  ./staging-access.sh serve    - Download and serve latest develop branch locally"
    echo "  ./staging-access.sh info     - Show this information"
    echo "  ./create-staging.sh          - Create local testing files manually"
    echo ""
}

# Main script logic
case "${1:-info}" in
    "serve")
        serve_local
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