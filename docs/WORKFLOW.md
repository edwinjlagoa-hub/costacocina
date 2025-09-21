# Simple Development Workflow

## Overview
La Costa Cocina uses a simplified development workflow focused on local testing and production deployment.

## 🔄 **Development Workflow**

### 1. Local Development
- Work on the `develop` branch
- Make changes to menu items, styling, or functionality
- Test changes locally before deploying

### 2. Local Testing
Choose from these testing options:

#### Option A: Automated Testing Script
```bash
./staging-access.sh serve
```
- Downloads latest develop branch
- Serves at http://localhost:8000
- Includes all latest changes

#### Option B: Manual Testing Files
```bash
./create-staging.sh
cd local-testing
python3 -m http.server 8000
```
- Creates testing files without Jekyll dependencies
- Adds testing banner and indicators
- Simple HTML files for quick testing

### 3. Production Deployment
When testing is complete:
1. **Merge**: `develop` → `main` branch
2. **Auto-Deploy**: GitHub Actions deploys to production
3. **Live Site**: https://lacostacocina.com

## 🛠️ **Available Tools**

| Tool | Purpose | Usage |
|------|---------|-------|
| `./staging-access.sh serve` | Download and serve latest develop | Local testing |
| `./create-staging.sh` | Create simple testing files | Quick local testing |
| GitHub Actions | Auto-deploy to production | Production deployment |

## 🌐 **URLs**

- **Production**: https://lacostacocina.com
- **Local Testing**: http://localhost:8000
- **Repository**: https://github.com/edwinjlagoa-hub/lacostacocina

## 📋 **Quick Start**

```bash
# 1. Make changes on develop branch
git checkout develop
# ... make your changes ...

# 2. Test locally
./staging-access.sh serve
# Opens at http://localhost:8000

# 3. Deploy to production when ready
git checkout main
git merge develop
git push origin main
# Production deploys automatically
```

## ✅ **Benefits of This Approach**

- **Simple**: No complex staging infrastructure
- **Fast**: Local testing is instant
- **Reliable**: Direct develop → production workflow
- **Cost-effective**: No additional hosting costs
- **Perfect for small sites**: Ideal for restaurant menu sites

## 🔧 **Technical Details**

### Local Testing Features
- ✅ All menu functionality
- ✅ QR code generation  
- ✅ Menu link features
- ✅ Responsive design
- ✅ Testing indicators

### Production Deployment
- ✅ GitHub Actions workflow
- ✅ Custom domain (lacostacocina.com)
- ✅ HTTPS enabled
- ✅ Clean, optimized files