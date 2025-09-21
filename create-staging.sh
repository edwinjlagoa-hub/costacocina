#!/bin/bash

# Simple Staging Deployment Script
# This creates a staging version without Jekyll processing

echo "🚀 Creating staging version..."

# Create staging directory
mkdir -p staging-temp

# Copy files
cp index.html staging-temp/
cp menu.html staging-temp/  
cp menu.js staging-temp/
cp menu-data.json staging-temp/
cp styles.css staging-temp/
cp menu-styles.css staging-temp/
cp script.js staging-temp/

# Create staging version of index.html without Jekyll
cd staging-temp
sed -i '' 's/{% if site.show_staging_banner %}/<!-- STAGING BANNER START -->/g' index.html
sed -i '' 's/{% endif %}/<!-- STAGING BANNER END -->/g' index.html
sed -i '' 's/{% if site.staging %}//g' index.html

# Add staging banner directly
sed -i '' 's/<body>/<body>\
    <div class="staging-banner">\
        🚧 STAGING ENVIRONMENT - This is a test version of the menu 🚧\
    <\/div>/g' index.html

# Add staging note
sed -i '' 's/<\/div>$/&\
        <p><em>Note: This is the staging version for testing.<\/em><\/p>/g' index.html

# Create CNAME for staging
echo "stage.lacostacocina.com" > CNAME

echo "✅ Staging files prepared in staging-temp/"
echo "📁 Files ready for deployment"
echo ""
echo "🌐 To serve locally:"
echo "   cd staging-temp && python3 -m http.server 8000"
echo ""
echo "🔗 Or upload to any static hosting service"

cd ..