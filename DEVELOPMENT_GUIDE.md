# Development Guide

Welcome to the NAASL project! This guide will walk you through everything you need to know to contribute to this project, from setting up your local environment to creating pull requests.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Getting Started](#getting-started)
3. [Git Workflow](#git-workflow)
4. [Creating Feature Branches](#creating-feature-branches)
5. [Making Changes](#making-changes)
6. [Committing Changes](#committing-changes)
7. [Creating Pull Requests](#creating-pull-requests)
8. [Project Structure](#project-structure)
9. [Running the Applications](#running-the-applications)
10. [Troubleshooting](#troubleshooting)

## Prerequisites

Before you begin, make sure you have the following installed on your computer:

### Required Software

1. **Git** - Version control system
   - Download: https://git-scm.com/downloads
   - Verify installation: `git --version`

2. **Python 3.10+** - For the backend
   - Download: https://www.python.org/downloads/
   - Verify installation: `python3 --version`

3. **Node.js 18+** - For the frontend
   - Download: https://nodejs.org/
   - Verify installation: `node --version`

4. **Package Managers**:
   - **pip** (comes with Python)
   - **pnpm** or **npm** (comes with Node.js)
     - Install pnpm: `npm install -g pnpm`

5. **Code Editor** (recommended: VS Code or Cursor)
   - VS Code: https://code.visualstudio.com/
   - Cursor: https://cursor.sh/

### Optional but Recommended

- **GitHub CLI** - For easier PR management
  - Install: https://cli.github.com/
- **PostgreSQL** - If you need a local database (optional, can use SQLite for development)

## Getting Started

### Step 1: Clone the Repository

First, you need to get a copy of the repository on your local machine.

1. **Navigate to where you want to store the project**:
   ```bash
   cd ~/Documents  # or wherever you prefer
   ```

2. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/naasl.git
   ```
   > Replace `your-username` with the actual GitHub username or organization name

3. **Navigate into the project directory**:
   ```bash
   cd naasl
   ```

### Step 2: Verify Your Setup

Check that you can see the project structure:
```bash
ls -la
```

You should see directories like:
- `apps/` - Contains frontend and backend applications
- `scripts/` - Contains utility scripts
- `DEVELOPMENT_GUIDE.md` - This file!

### Step 3: Set Up Backend

See the [Backend README](apps/naasl-backend/README.md) for detailed setup instructions.

Quick setup:
```bash
cd apps/naasl-backend
python3 -m venv .venv
source .venv/bin/activate  # On Windows: .venv\Scripts\activate
pip install --upgrade pip
pip install -e ".[dev]"
```

### Step 4: Set Up Frontend

See the [Frontend README](apps/naasl-frontend/README.md) for detailed setup instructions.

Quick setup:
```bash
cd apps/naasl-frontend
pnpm install  # or npm install
```

## Git Workflow

This project uses a **feature branch workflow**. This means:
- The `main` branch contains stable, production-ready code
- Each new feature or bug fix is developed in its own branch
- Changes are merged back to `main` via Pull Requests (PRs)

### Understanding Branches

- **`main`** - The main branch with stable code (don't commit directly here!)
- **`feature/your-feature-name`** - Your feature branch (you'll create this)
- **`bugfix/your-bug-name`** - For bug fixes
- **`hotfix/your-hotfix-name`** - For urgent production fixes

## Creating Feature Branches

Always create a new branch before making changes. **Never commit directly to `main`**.

### Step 1: Make Sure You're Up to Date

Before creating a new branch, ensure your local `main` branch is up to date:

```bash
# Switch to main branch
git checkout main

# Pull the latest changes from remote
git pull origin main
```

### Step 2: Create Your Feature Branch

Create and switch to a new branch:

```bash
# Create and switch to a new branch
git checkout -b feature/your-feature-name
```

**Branch Naming Conventions:**
- Features: `feature/add-user-authentication`
- Bug fixes: `bugfix/fix-login-error`
- Hotfixes: `hotfix/security-patch`
- Use lowercase and hyphens, be descriptive

**Examples:**
```bash
git checkout -b feature/add-horse-search
git checkout -b bugfix/fix-image-loading
git checkout -b feature/update-database-schema
```

### Step 3: Verify You're on the Right Branch

Check which branch you're on:
```bash
git branch
```

You should see an asterisk (*) next to your new branch name.

## Making Changes

Now you're ready to make changes to the code!

### Best Practices

1. **Make small, focused changes** - Each commit should represent one logical change
2. **Test your changes** - Make sure your code works before committing
3. **Follow code style** - The project uses:
   - Python: Follow PEP 8 (use `ruff` for linting)
   - TypeScript/React: Follow ESLint rules
4. **Write clear commit messages** - See the commit section below

### Editing Files

1. Open files in your code editor
2. Make your changes
3. Save the files
4. Test that everything still works

## Committing Changes

### Step 1: Check What You've Changed

Before committing, see what files you've modified:

```bash
git status
```

This shows:
- Modified files (in red)
- New files (in red, marked as "untracked")
- Files staged for commit (in green)

### Step 2: Stage Your Changes

You need to "stage" files before committing. This tells Git which changes you want to include in the commit.

**Stage a specific file:**
```bash
git add path/to/file.py
```

**Stage all changes:**
```bash
git add .
```

**Stage specific types of files:**
```bash
git add *.py  # All Python files
git add apps/naasl-frontend/  # All files in a directory
```

### Step 3: Commit Your Changes

Once files are staged, commit them with a descriptive message:

```bash
git commit -m "Add horse search functionality"
```

**Good Commit Messages:**
- Start with a verb in present tense: "Add", "Fix", "Update", "Remove"
- Be specific: "Fix image loading error on horse detail page"
- Keep it concise but descriptive
- Reference issue numbers if applicable: "Fix #123: Add error handling"

**Examples:**
```bash
git commit -m "Add horse search autocomplete component"
git commit -m "Fix database connection timeout issue"
git commit -m "Update README with setup instructions"
git commit -m "Fix #45: Resolve CORS error in API"
```

### Step 4: Push Your Branch to GitHub

After committing, push your branch to GitHub:

```bash
git push origin feature/your-feature-name
```

If this is the first time pushing this branch, Git will ask you to set the upstream:
```bash
git push -u origin feature/your-feature-name
```

The `-u` flag sets up tracking so future pushes are simpler.

### Step 5: Continue Working

If you need to make more changes:
1. Edit files
2. `git add .` (or specific files)
3. `git commit -m "Your message"`
4. `git push` (no need for full command after first push)

## Creating Pull Requests

A Pull Request (PR) is how you propose changes to be merged into the `main` branch.

### Step 1: Push Your Final Changes

Make sure all your commits are pushed:
```bash
git push
```

### Step 2: Create PR on GitHub

1. **Go to the GitHub repository** in your web browser
2. **You'll see a banner** saying "Your recently pushed branches" with a "Compare & pull request" button
3. **Click "Compare & pull request"**

   OR

   - Click the "Pull requests" tab
   - Click "New pull request"
   - Select your branch from the dropdown

### Step 3: Fill Out the PR Form

**Title:**
- Clear, descriptive title
- Example: "Add horse search autocomplete feature"

**Description:**
Include:
- **What** you changed and **why**
- **How** to test the changes
- **Screenshots** (if UI changes)
- **Related issues** (if any)

**Example Description:**
```markdown
## What
Added autocomplete search functionality to the horse search bar.

## Why
Users need a faster way to find horses by name without typing the full name.

## How to Test
1. Start the frontend: `cd apps/naasl-frontend && pnpm dev`
2. Navigate to the search bar
3. Type a few letters of a horse name
4. Verify autocomplete suggestions appear

## Screenshots
[Add screenshots if applicable]

## Related Issues
Closes #123
```

### Step 4: Request Review

1. **Add reviewers** - Click "Reviewers" and select team members
2. **Add labels** - Use labels like "feature", "bugfix", "frontend", "backend"
3. **Link issues** - Reference related issues in the description
4. **Click "Create pull request"**

### Step 5: Address Review Feedback

Reviewers may request changes:

1. **Read the feedback** carefully
2. **Make the requested changes** on your branch
3. **Commit and push** the changes:
   ```bash
   git add .
   git commit -m "Address review feedback: fix typo in component"
   git push
   ```
4. **The PR updates automatically** - No need to create a new PR!

### Step 6: PR is Merged

Once approved, a maintainer will merge your PR. After merging:
1. **Delete your local branch** (optional cleanup):
   ```bash
   git checkout main
   git pull origin main
   git branch -d feature/your-feature-name
   ```

2. **Start fresh** for your next feature!

## Project Structure

```
naasl/
├── apps/
│   ├── naasl-backend/      # Python FastAPI backend
│   │   ├── app/            # Application code
│   │   ├── tests/          # Test files
│   │   └── README.md       # Backend-specific docs
│   ├── naasl-frontend/     # Next.js React frontend
│   │   ├── app/            # Next.js app directory
│   │   ├── components/     # React components
│   │   └── README.md       # Frontend-specific docs
│   └── QUICK_START.md      # Quick start guide
├── scripts/                # Utility scripts
│   ├── image cleaning/     # Image processing scripts
│   ├── web scraping/       # Web scraping scripts
│   └── README.md           # Scripts documentation
└── DEVELOPMENT_GUIDE.md    # This file!
```

## Running the Applications

### Running Backend

```bash
cd apps/naasl-backend
source .venv/bin/activate  # Activate virtual environment
uvicorn app.main:app --reload
```

Backend runs on: http://127.0.0.1:8000
API docs: http://127.0.0.1:8000/docs

### Running Frontend

```bash
cd apps/naasl-frontend
pnpm dev  # or npm run dev
```

Frontend runs on: http://localhost:3000

See [QUICK_START.md](apps/QUICK_START.md) for more details.

## Troubleshooting

### Git Issues

**Problem: "Your branch is behind 'origin/main'"**
```bash
# Update your branch with latest main
git checkout main
git pull origin main
git checkout feature/your-feature-name
git merge main  # or git rebase main
```

**Problem: "Permission denied" when pushing**
- Make sure you have write access to the repository
- Check your Git credentials: `git config --list`

**Problem: "Merge conflicts"**
- Git can't automatically merge your changes
- Open the conflicted files and look for `<<<<<<<`, `=======`, `>>>>>>>` markers
- Manually resolve conflicts, then:
  ```bash
  git add .
  git commit -m "Resolve merge conflicts"
  ```

### Environment Issues

**Backend won't start:**
- Check Python version: `python3 --version` (need 3.10+)
- Activate virtual environment: `source .venv/bin/activate`
- Install dependencies: `pip install -e ".[dev]"`
- Check `.env` file exists: `cp config/env.example .env`

**Frontend won't start:**
- Check Node version: `node --version` (need 18+)
- Install dependencies: `pnpm install`
- Clear cache: `rm -rf .next node_modules && pnpm install`

**Can't connect frontend to backend:**
- Make sure backend is running on port 8000
- Check CORS settings in backend `.env`
- Verify `NEXT_PUBLIC_API_BASE_URL` in frontend `.env.local`

### Getting Help

1. **Check the README files** in each directory
2. **Search existing issues** on GitHub
3. **Ask in team chat** or create a new issue
4. **Review the code** - other similar features might show the pattern

## Additional Resources

- [Git Documentation](https://git-scm.com/doc)
- [GitHub Guides](https://guides.github.com/)
- [Python Best Practices](https://docs.python-guide.org/)
- [React Documentation](https://react.dev/)
- [Next.js Documentation](https://nextjs.org/docs)

## Quick Reference

### Common Git Commands

```bash
# Check status
git status

# See what branch you're on
git branch

# Create and switch to new branch
git checkout -b feature/name

# Stage all changes
git add .

# Commit changes
git commit -m "Your message"

# Push to GitHub
git push

# Pull latest changes
git pull origin main

# Switch branches
git checkout branch-name
```

### Workflow Summary

1. `git checkout main` - Switch to main
2. `git pull origin main` - Get latest changes
3. `git checkout -b feature/name` - Create feature branch
4. Make changes, test, commit, push
5. Create PR on GitHub
6. Address feedback, push updates
7. PR gets merged!

---

**Happy coding! 🚀**

If you have questions or need help, don't hesitate to ask the team!

