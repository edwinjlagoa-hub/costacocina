#!/bin/bash

# Local Testing File Creator
# This creates local testing files without complex dependencies

echo "🧪 Creating local testing version..."

# Create local testing directory
mkdir -p local-testing

# Copy files
cp index.html local-testing/
cp menu.html local-testing/  
cp menu.js local-testing/
cp menu-data.json local-testing/
cp styles.css local-testing/
cp menu-styles.css local-testing/
cp script.js local-testing/

# Create testing version of index.html without Jekyll
cd local-testing
sed -i '' 's/{% if site.show_staging_banner %}/<!-- LOCAL TESTING BANNER START -->/g' index.html
sed -i '' 's/{% endif %}/<!-- LOCAL TESTING BANNER END -->/g' index.html
sed -i '' 's/{% if site.staging %}//g' index.html

# Add testing banner directly
sed -i '' 's/<body>/<body>\
    <div class="staging-banner">\
        🧪 LOCAL TESTING - This is a development version\
    <\/div>/g' index.html

# Add testing note
sed -i '' 's/<\/div>$/&\
        <p><em>Note: This is the local testing version.<\/em><\/p>/g' index.html

echo "✅ Local testing files prepared in local-testing/"
echo "📁 Files ready for local development"
echo ""
echo "🌐 To serve locally:"
echo "   cd local-testing && python3 -m http.server 8000"
echo ""
echo "🔗 Then open: http://localhost:8000"
echo ""
echo "🚀 When ready, deploy to production:"
echo "   1. Test everything works locally"
echo "   2. Merge develop → main"  
echo "   3. Production auto-deploys to https://lacostacocina.com"

cd ..