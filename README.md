# NAASL

NAASL is a comprehensive platform for managing and exploring horse pedigree data, competitions, and related information.

##  Documentation

This repository contains multiple applications and utilities. Start here:

- **[DEVELOPMENT_GUIDE.md](./DEVELOPMENT_GUIDE.md)** - Complete development guide for new contributors
  - Setting up your local environment
  - Git workflow and branching
  - Creating pull requests
  - Troubleshooting

- **[apps/QUICK_START.md](./apps/QUICK_START.md)** - Quick start guide for running the applications

##  Project Structure

```
naasl/
├── apps/
│   ├── naasl-backend/      # FastAPI Python backend
│   │   └── README.md       # Backend setup and documentation
│   ├── naasl-frontend/     # Next.js React frontend
│   │   └── README.md       # Frontend setup and documentation
│   └── QUICK_START.md      # Quick start guide
├── scripts/                # Utility scripts
│   ├── image cleaning/     # Image processing scripts
│   ├── web scraping/       # Web scraping scripts
│   └── README.md           # Scripts documentation
├── DEVELOPMENT_GUIDE.md    # Main development guide
└── README.md               # This file
```

## 🚀 Quick Start

### Prerequisites

- **Python 3.10+** - For backend
- **Node.js 18+** - For frontend
- **Git** - Version control

### Running the Applications

1. **Backend:**
   ```bash
   cd apps/naasl-backend
   python3 -m venv .venv
   source .venv/bin/activate
   pip install -e ".[dev]"
   uvicorn app.main:app --reload
   ```
   See [Backend README](./apps/naasl-backend/README.md) for details.

2. **Frontend:**
   ```bash
   cd apps/naasl-frontend
   pnpm install
   pnpm dev
   ```
   See [Frontend README](./apps/naasl-frontend/README.md) for details.

For more detailed instructions, see [QUICK_START.md](./apps/QUICK_START.md).

##  Getting Started as a Developer

If you're new to the project:

1. **Read the [DEVELOPMENT_GUIDE.md](./DEVELOPMENT_GUIDE.md)** - Comprehensive guide covering:
   - Cloning the repository
   - Setting up your environment
   - Git workflow
   - Creating branches
   - Making commits
   - Creating pull requests

2. **Set up your local environment:**
   - Follow the prerequisites section
   - Clone the repository
   - Set up backend and frontend

3. **Start contributing:**
   - Create a feature branch
   - Make your changes
   - Submit a pull request

##  Applications

### Backend (`apps/naasl-backend/`)

FastAPI-based REST API providing:
- Horse data management
- Search and filtering
- Database integration
- API documentation

**Tech Stack:** Python, FastAPI, SQLAlchemy, PostgreSQL/SQLite

See [Backend README](./apps/naasl-backend/README.md) for setup and development.

### Frontend (`apps/naasl-frontend/`)

Next.js React application providing:
- User interface
- Horse browsing and search
- Responsive design
- Multi-language support (Arabic/English)

**Tech Stack:** Next.js 15, React 19, TypeScript, Tailwind CSS, shadcn/ui

See [Frontend README](./apps/naasl-frontend/README.md) for setup and development.

##  Scripts (`scripts/`)

Utility scripts for:
- **Image Cleaning** - Processing and organizing horse images
- **Web Scraping** - Collecting data from various sources:
  - AllBreedPedigree.com
  - ArabianEssence.com
  - FEI (Fédération Equestre Internationale)

See [Scripts README](./scripts/README.md) for usage and documentation.

##  Development

### Common Tasks

**Starting development:**
```bash
# Terminal 1 - Backend
cd apps/naasl-backend
source .venv/bin/activate
uvicorn app.main:app --reload

# Terminal 2 - Frontend
cd apps/naasl-frontend
pnpm dev
```

**Running tests:**
```bash
# Backend tests
cd apps/naasl-backend
pytest

# Frontend linting
cd apps/naasl-frontend
pnpm lint
```

**Creating a feature:**
1. `git checkout main`
2. `git pull origin main`
3. `git checkout -b feature/your-feature-name`
4. Make changes, commit, push
5. Create pull request on GitHub

See [DEVELOPMENT_GUIDE.md](./DEVELOPMENT_GUIDE.md) for complete workflow.

## 📝 Contributing

1. Read the [DEVELOPMENT_GUIDE.md](./DEVELOPMENT_GUIDE.md)
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

##  Links

- **Development Guide:** [DEVELOPMENT_GUIDE.md](./DEVELOPMENT_GUIDE.md)
- **Backend Docs:** [apps/naasl-backend/README.md](./apps/naasl-backend/README.md)
- **Frontend Docs:** [apps/naasl-frontend/README.md](./apps/naasl-frontend/README.md)
- **Scripts Docs:** [scripts/README.md](./scripts/README.md)
- **Quick Start:** [apps/QUICK_START.md](./apps/QUICK_START.md)

## 📄 License

[Add license information here]

##  Support

For questions or issues:
- Check the documentation in each directory
- Review the [DEVELOPMENT_GUIDE.md](./DEVELOPMENT_GUIDE.md)
- Contact the development team

---

**Welcome to NAASL! 🐴**

