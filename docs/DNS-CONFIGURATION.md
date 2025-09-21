# DNS Configuration for Staging Environment

## Overview
The staging environment is configured to use the subdomain `stage.lacostacocina.com`.

## Required DNS Records in GoDaddy

You need to add **one additional CNAME record** for the staging subdomain:

### Staging Subdomain
```
Type: CNAME
Name: stage
Value: edwinjlagoa-hub.github.io
TTL: 600 (or default)
```

## Complete DNS Setup

Your complete DNS configuration in GoDaddy should include:

### Production (Root Domain)
```
Type: A
Name: @ (or leave blank)
Value: 185.199.108.153

Type: A  
Name: @ (or leave blank)
Value: 185.199.109.153

Type: A
Name: @ (or leave blank)
Value: 185.199.110.153

Type: A
Name: @ (or leave blank)
Value: 185.199.111.153
```

### WWW Subdomain
```
Type: CNAME
Name: www
Value: edwinjlagoa-hub.github.io
```

### Staging Subdomain
```
Type: CNAME
Name: stage
Value: edwinjlagoa-hub.github.io
```

## After DNS Configuration

Once you've added the staging CNAME record:

1. **Wait for DNS propagation** (usually 15-30 minutes)
2. **Test the staging URL**: https://stage.lacostacocina.com
3. **Verify staging features**: Look for the staging banner and environment indicators

## URLs Overview

| Environment | URL | Purpose |
|------------|-----|---------|
| Production | https://lacostacocina.com | Live restaurant menu |
| Production | https://www.lacostacocina.com | Redirects to main site |
| Staging | https://stage.lacostacocina.com | Testing new changes |

## Development Workflow

1. **Make changes** on `develop` branch
2. **Push to develop** - triggers staging deployment
3. **Test at** https://stage.lacostacocina.com
4. **Merge to main** when ready for production
5. **Production updates** at https://lacostacocina.com

## DNS Verification

You can verify your DNS settings with:

```bash
# Check staging subdomain
nslookup stage.lacostacocina.com

# Check production domain  
nslookup lacostacocina.com

# Check www subdomain
nslookup www.lacostacocina.com
```

All should point to GitHub's servers (185.199.108-111.153 for A records, edwinjlagoa-hub.github.io for CNAME records).