# Quick Deployment Steps

Follow these steps to deploy your portfolio to GitHub Pages:

## 1. Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: **portfolio**
3. Make it **Public**
4. **DO NOT** check any initialization options
5. Click "Create repository"

## 2. Push Your Code

Run these commands in your terminal (in the portfolio directory):

```bash
# Check if git is initialized
git status

# If not initialized, run:
git init

# Add remote (replace with your actual repo URL)
git remote add origin https://github.com/hassanteslim007/portfolio.git

# Add all files
git add .

# Commit everything
git commit -m "feat: complete portfolio with GitHub Pages deployment"

# Push to GitHub
git branch -M main
git push -u origin main
```

## 3. Enable GitHub Pages

1. Go to: https://github.com/hassanteslim007/portfolio/settings/pages
2. Under "Build and deployment":
   - **Source**: Select **"GitHub Actions"**
3. The workflow will automatically start

## 4. Wait for Deployment

1. Go to: https://github.com/hassanteslim007/portfolio/actions
2. Watch the "Deploy to GitHub Pages" workflow
3. Wait for the green checkmark (2-5 minutes)

## 5. Visit Your Live Site

Your portfolio will be live at:
**https://hassanteslim007.github.io/portfolio/**

---

## Future Updates

After making any changes to your portfolio:

```bash
git add .
git commit -m "Description of your changes"
git push
```

The site will automatically rebuild and redeploy!

## Need Help?

See the full [DEPLOYMENT.md](DEPLOYMENT.md) guide for detailed instructions and troubleshooting.
