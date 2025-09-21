# La Costa Cocina Menu - Development Workflow

## Branching Strategy

This repository uses a **development branch strategy** to ensure menu updates are tested before going live to customers.

### Branch Structure

```
main (production) ← GitHub Pages deploys to: https://edwinjlagoa-hub.github.io/lacostacocina
↑
develop (staging) ← For testing menu changes before production
↑
feature/menu-updates ← Feature branches for specific changes
feature/pricing-updates
hotfix/urgent-fixes
```

## Workflow Overview

### 🍽️ For Menu Updates (Recommended)

1. **Create a feature branch from develop:**
   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b feature/add-winter-specials
   ```

2. **Make your menu changes:**
   - Update `menu-data.json` for menu items
   - Modify `menu-styles.css` for styling
   - Test locally by opening `menu.html`

3. **Commit and push changes:**
   ```bash
   git add .
   git commit -m "Add winter specials to menu"
   git push origin feature/add-winter-specials
   ```

4. **Create Pull Request to develop:**
   - Go to GitHub and create a PR from your feature branch to `develop`
   - Review changes in the staging build
   - Merge when satisfied

5. **Deploy to production:**
   - Create PR from `develop` to `main`
   - Review final changes
   - Merge to deploy live to customers

### 🚀 For Urgent Fixes (Hotfix)

1. **Create hotfix branch from main:**
   ```bash
   git checkout main
   git pull origin main
   git checkout -b hotfix/fix-price-typo
   ```

2. **Fix the issue and test**

3. **Create PR directly to main:**
   - Merge when ready for immediate deployment

4. **Merge back to develop:**
   ```bash
   git checkout develop
   git merge main
   ```

## GitHub Actions Workflows

### Production Deployment (`deploy.yml`)
- **Trigger:** Push to `main` branch
- **Deploys to:** https://edwinjlagoa-hub.github.io/lacostacocina
- **Purpose:** Live customer-facing menu

### Staging Deployment (`staging.yml`)
- **Trigger:** Push to `develop` branch  
- **Builds:** Staging version with modified baseurl
- **Purpose:** Test menu changes before production

## Branch Protection (Recommended Setup)

### Main Branch Protection
- Require pull request reviews
- Require status checks to pass
- Restrict pushes to main branch
- Require branches to be up to date

### Setup Instructions
1. Go to GitHub repository → Settings → Branches
2. Add rule for `main` branch:
   - ✅ Require a pull request before merging
   - ✅ Require approvals (1)
   - ✅ Dismiss stale reviews when new commits are pushed
   - ✅ Require status checks to pass before merging

## Local Development

### Initial Setup
```bash
# Clone the repository
git clone https://github.com/edwinjlagoa-hub/lacostacocina.git
cd lacostacocina

# Create and switch to develop branch
git checkout -b develop
git push -u origin develop
```

### Testing Menu Changes Locally
1. Open `index.html` or `menu.html` in your browser
2. Make changes to menu files
3. Refresh browser to see changes
4. Commit when satisfied

## Common Commands

### Switch to develop branch
```bash
git checkout develop
git pull origin develop
```

### Create new feature branch
```bash
git checkout develop
git checkout -b feature/your-feature-name
```

### Update develop from main
```bash
git checkout develop
git merge main
git push origin develop
```

### See current branch and status
```bash
git branch -a
git status
```

## File Structure

```
lacostacocina/
├── _config.yml          # Jekyll configuration
├── index.html           # Main landing page
├── menu.html            # Menu display page
├── menu-data.json       # Menu items and pricing
├── menu-styles.css      # Menu-specific styles
├── menu.js              # Menu functionality
├── script.js            # General JavaScript
├── styles.css           # General styles
└── .github/
    └── workflows/
        ├── deploy.yml   # Production deployment
        └── staging.yml  # Staging deployment
```

## Tips for Restaurant Menu Management

### Menu Updates Best Practices
1. **Seasonal Changes:** Use feature branches for seasonal menu updates
2. **Price Updates:** Test pricing changes in staging before production
3. **New Items:** Add photos and descriptions in develop first
4. **Daily Specials:** Can be updated directly in develop → main for quick deployment

### Emergency Procedures
- **Sold Out Items:** Use hotfix workflow for immediate removal
- **Price Corrections:** Hotfix for urgent price fixes
- **Broken Links/Images:** Hotfix for critical display issues

## Support

For technical issues with the workflow, check:
1. GitHub Actions logs for deployment errors
2. Jekyll build logs for configuration issues
3. Browser developer tools for frontend issues

---

**Quick Reference:**
- 🔴 **Production Site:** https://edwinjlagoa-hub.github.io/lacostacocina
- 🟡 **Development:** `develop` branch → staging builds
- 🟢 **New Features:** `feature/*` branches → develop → main