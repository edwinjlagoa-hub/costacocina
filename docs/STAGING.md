# Staging Environment Documentation

## Overview
The La Costa Cocina project now has a permanent staging environment that automatically deploys changes from the `develop` branch to a separate `staging-site` branch.

## How It Works

### Automatic Deployment
- When you push changes to the `develop` branch, GitHub Actions automatically:
  1. Builds the site with staging-specific configuration
  2. Deploys the built site to the `staging-site` branch
  3. Adds staging banners and environment indicators

### Staging Branch
- **Branch Name**: `staging-site`
- **Purpose**: Contains the built staging website files
- **Access**: https://github.com/edwinjlagoa-hub/lacostacocina/tree/staging-site

## Testing Your Changes

### Option 1: Local Testing (Recommended)
```bash
# Use the provided script
./staging-access.sh serve

# Or manually:
git clone --single-branch --branch staging-site https://github.com/edwinjlagoa-hub/lacostacocina.git staging-temp
cd staging-temp
python3 -m http.server 8000
# Open http://localhost:8000 in your browser
```

### Option 2: Direct File Access
- Browse files directly on GitHub: https://github.com/edwinjlagoa-hub/lacostacocina/tree/staging-site
- Download individual files to test locally

### Option 3: GitHub Pages (Optional)
If you want to enable GitHub Pages for the staging branch:
1. Go to repository Settings → Pages
2. Set source to "Deploy from a branch"
3. Select `staging-site` branch
4. Staging will be available at `https://edwinjlagoa-hub.github.io/lacostacocina`

## Development Workflow

### For Testing Changes
1. Make changes on the `develop` branch
2. Push to `develop`
3. Wait for staging deployment to complete (~2-3 minutes)
4. Test using one of the methods above

### For Production Release
1. Test thoroughly in staging
2. Merge `develop` → `main`
3. Production deployment happens automatically
4. Site updates at https://lacostacocina.com (once DNS is configured)

## Staging Features

### Visual Indicators
- Staging banner at the top of the page
- Different styling to distinguish from production
- "STAGING" labels in the browser title

### Environment Detection
- JavaScript automatically detects staging environment
- QR codes and links work correctly in staging context
- All menu functionality preserved

## Monitoring Deployments

### GitHub Actions
- View deployment status: https://github.com/edwinjlagoa-hub/lacostacocina/actions
- Staging workflow: "Deploy Staging Branch"
- Production workflow: "Deploy to Production"

### Troubleshooting
If staging deployment fails:
1. Check GitHub Actions logs
2. Verify `develop` branch has valid changes
3. Ensure Jekyll configuration is valid
4. Re-run the workflow manually if needed

## Files and Configuration

### Modified Files
- `.github/workflows/staging.yml` - Staging deployment workflow
- `staging-access.sh` - Helper script for local testing
- `docs/STAGING.md` - This documentation

### Staging Configuration
The staging build automatically adds:
```yaml
staging: true
environment: staging
show_staging_banner: true
```

This enables staging-specific features and visual indicators throughout the site.