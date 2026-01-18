# GitHub Pages Deployment Guide

This guide will help you deploy your Flutter portfolio to GitHub Pages.

## Prerequisites

- Git installed
- GitHub account (username: hassanteslim007)
- Flutter SDK installed

## Step 1: Create GitHub Repository

1. Go to [GitHub](https://github.com) and sign in
2. Click the "+" icon in the top right and select "New repository"
3. Repository settings:
   - **Repository name**: `portfolio`
   - **Description**: "Professional Flutter portfolio showcasing projects and skills"
   - **Visibility**: Public
   - **DO NOT** initialize with README, .gitignore, or license (we already have these)

## Step 2: Initialize Git and Push Code

Run these commands in your portfolio directory:

```bash
# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: Complete portfolio with theme toggle and contact form"

# Add remote repository
git remote add origin https://github.com/hassanteslim007/portfolio.git

# Push to GitHub
git branch -M main
git push -u origin main
```

## Step 3: Enable GitHub Pages

1. Go to your repository on GitHub: `https://github.com/hassanteslim007/portfolio`
2. Click on **Settings** (top menu)
3. In the left sidebar, click **Pages**
4. Under "Build and deployment":
   - **Source**: Select "GitHub Actions"
5. Save the settings

## Step 4: Trigger Deployment

The GitHub Actions workflow will automatically trigger on push to main. To manually trigger:

1. Go to the **Actions** tab in your repository
2. Click on "Deploy to GitHub Pages" workflow
3. Click "Run workflow" → "Run workflow"

## Step 5: Verify Deployment

After the workflow completes (usually 2-5 minutes):

1. Visit: `https://hassanteslim007.github.io/portfolio/`
2. Test all features:
   - Theme toggle (light/dark mode)
   - Project cards and detail views
   - Contact form
   - Navigation and animations

## Local Testing Before Deployment

To test the production build locally:

```bash
# Build for web
flutter build web --release --base-href /portfolio/

# Serve locally (requires Python or any HTTP server)
cd build/web
python3 -m http.server 8000

# Visit: http://localhost:8000
```

## Troubleshooting

### Assets not loading
- Ensure all asset paths in `pubspec.yaml` are correct
- Check that the `--base-href` flag is set to `/portfolio/`

### GitHub Actions failing
- Check the Actions tab for error logs
- Verify Flutter version in workflow matches your local version
- Ensure all dependencies are in `pubspec.yaml`

### 404 errors
- Verify GitHub Pages is enabled in repository settings
- Check that the repository name matches the base-href
- Wait a few minutes after deployment for DNS propagation

## Updating Your Portfolio

After making changes:

```bash
git add .
git commit -m "Description of changes"
git push
```

The site will automatically rebuild and redeploy!

## Custom Domain (Optional)

To use a custom domain like `hassanteslim.dev`:

1. Buy a domain from a registrar
2. Add a `CNAME` file to `web/` folder with your domain
3. Configure DNS settings at your registrar
4. Update base-href to `/` in the workflow
5. Enable custom domain in GitHub Pages settings

## Repository URL

Your portfolio will be available at:
- **Live Site**: https://hassanteslim007.github.io/portfolio/
- **Repository**: https://github.com/hassanteslim007/portfolio
