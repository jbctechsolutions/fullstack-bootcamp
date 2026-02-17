# Devcontainer Setup Guide for Windows Users

## Overview

This guide helps you set up the fullstack bootcamp using **development containers** (devcontainers). This is the **recommended quick-start path** for Windows users, offering a consistent, pre-configured development environment that works identically across Windows, macOS, and Linux.

## What are Devcontainers?

Development containers are Docker containers specifically configured for development. They include:
- All required tools and dependencies pre-installed
- VS Code/Cursor extensions automatically configured
- Consistent environment across all team members
- Isolated workspace (won't affect your system)

## Why Use Devcontainers?

**Benefits:**
- ⚡ **Fast Setup**: Coding in 5-10 minutes
- 🔒 **Consistent**: Everyone uses the same environment
- 🧹 **Clean**: Doesn't install tools on your system
- 🔄 **Reproducible**: Identical setup every time
- 🚀 **GitHub Codespaces Ready**: Works in the cloud too

**Works with:**
- **VS Code**: Microsoft's open-source code editor
- **Cursor**: AI-powered fork of VS Code (fully compatible)

---

## Prerequisites

Before starting, you need:

### 1. Docker Desktop for Windows
**Download:** https://www.docker.com/products/docker-desktop

**Requirements:**
- Windows 10/11 (build 19041 or higher)
- WSL 2 backend enabled (installer will help with this)
- At least 4GB RAM allocated to Docker

**Installation Steps:**
1. Download Docker Desktop installer
2. Run installer and follow prompts
3. Enable WSL 2 integration when prompted
4. Restart your computer if required
5. Launch Docker Desktop and wait for it to start

**Verify Installation:**
```powershell
docker --version
docker run hello-world
```

### 2. VS Code or Cursor

**Option A: VS Code**
- **Download:** https://code.visualstudio.com/
- **Install Extension:** [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
  ```bash
  code --install-extension ms-vscode-remote.remote-containers
  ```

**Option B: Cursor**
- **Download:** https://cursor.sh/
- **Built-in Support:** Dev Containers support is included
- **Note:** Cursor is a fork of VS Code with AI features, so all VS Code devcontainer features work identically

### 3. Git for Windows
**Download:** https://git-scm.com/download/win

**Installation:**
- Use default settings during installation
- Choose "Git from the command line and also from 3rd-party software"

---

## Choosing Your Learning Path

The bootcamp offers **two devcontainer configurations** based on your chosen path:

| Feature | Software Engineering | Data Analysis |
|---------|---------------------|---------------|
| **Focus** | Web development (Flask + React) | Data science & analytics |
| **Tools** | Python, Node.js, PostgreSQL, Docker | Python, Jupyter, PostgreSQL, Data science libs |
| **Extensions** | ESLint, Prettier, Python, Docker | Jupyter, Python, Docker |
| **Ports** | 5432 (DB), 5000 (Flask), 3000 (React) | 5432 (DB), 8888 (Jupyter) |
| **Best For** | Building web applications | Analyzing data, ML, reporting |

**Choose based on:**
- Your career interests (development vs analytics)
- Which bootcamp curriculum you're following
- You can switch later by opening the other devcontainer

---

## Setup Instructions

### Step 1: Clone the Repository

Open **Command Prompt** or **PowerShell**:

```powershell
# Navigate to where you want the project
cd %USERPROFILE%\Documents

# Clone the repository
git clone git@github.com:your-org/fullstack-bootcamp.git
cd fullstack-bootcamp\kyoto-v1
```

### Step 2: Open in VS Code/Cursor

**VS Code:**
```powershell
code .
```

**Cursor:**
```powershell
cursor .
```

Or use File → Open Folder and select the `kyoto-v1` directory.

### Step 3: Open Devcontainer

#### For VS Code:
1. Press `F1` or `Ctrl+Shift+P` to open command palette
2. Type "Dev Containers: Open Folder in Container"
3. Select your path:
   - Choose `.devcontainer/software-engineering/` **OR**
   - Choose `.devcontainer/data-analysis/`

#### For Cursor:
1. Press `Ctrl+Shift+P` to open command palette
2. Type "Remote-Containers: Open Folder in Container"
3. Select your path:
   - Choose `.devcontainer/software-engineering/` **OR**
   - Choose `.devcontainer/data-analysis/`

**Note:** Cursor uses the same keyboard shortcuts and commands as VS Code for devcontainers.

### Step 4: Wait for Container Build

**First time:**
- Building the container takes **5-10 minutes**
- Docker downloads base images (~2-3 GB)
- Extensions install automatically
- Dependencies get configured

**Progress indicators:**
- VS Code: Bottom-right notification shows progress
- Cursor: Same progress notifications as VS Code
- You can click "Show Log" to see details

**Subsequent starts:**
- Container starts in ~30 seconds
- No re-download needed

### Step 5: Verify the Environment

Once the container is running, open a new terminal:
- **VS Code/Cursor:** Terminal → New Terminal (or `` Ctrl+` ``)

The terminal is now **inside the container**. Run verification checks:

**Software Engineering Path:**
```bash
# Check tools
python --version    # Should show 3.9+
node --version      # Should show 18+
docker --version    # Docker-in-Docker for Days 5-6
psql --version      # PostgreSQL client

# Test database connection
psql -h localhost -U postgres -d bootcamp_db -c "SELECT version();"
# Password: dev_password
```

**Data Analysis Path:**
```bash
# Check tools
python --version    # Should show 3.9+
jupyter --version   # JupyterLab

# Test Python packages
python -c "import pandas, numpy, matplotlib, seaborn, sklearn; print('All packages loaded!')"

# Test database connection
psql -h localhost -U postgres -d bootcamp_db -c "SELECT version();"
# Password: dev_password
```

**Expected Output:**
- All version commands succeed
- Database connection works
- No errors

---

## First-Time Configuration

### 1. Configure Git

Inside the container terminal:

```bash
# Set your identity
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Verify
git config --list
```

### 2. Generate SSH Key

Generate an SSH key for GitHub authentication:

```bash
# Generate key
ssh-keygen -t ed25519 -C "your.email@example.com"

# Press Enter to accept default location
# Enter a passphrase (recommended) or leave empty

# Start ssh-agent
eval "$(ssh-agent -s)"

# Add key to agent
ssh-add ~/.ssh/id_ed25519

# Display public key to copy
cat ~/.ssh/id_ed25519.pub
```

### 3. Add SSH Key to GitHub

1. Copy the output from `cat ~/.ssh/id_ed25519.pub`
2. Go to GitHub: Settings → SSH and GPG keys → New SSH key
3. Paste your key and give it a title (e.g., "Bootcamp Devcontainer")
4. Click "Add SSH key"

**Test connection:**
```bash
ssh -T git@github.com
# Should show: "Hi username! You've successfully authenticated..."
```

### 4. Access JupyterLab (Data Analysis Path Only)

JupyterLab starts automatically in the Data Analysis container:

1. Look for the **PORTS** tab in VS Code/Cursor (next to Terminal)
2. Find port **8888** (JupyterLab)
3. Click the **Open in Browser** icon
4. Or navigate to: http://localhost:8888

**No token required** - configured for development mode

---

## Daily Workflow

### Starting Your Work

1. **Open Docker Desktop** - Make sure it's running
2. **Open VS Code/Cursor**
3. **Open your project folder**
4. **Reopen in Container:**
   - VS Code/Cursor detects the devcontainer
   - Click "Reopen in Container" notification
   - Or press `F1` → "Dev Containers: Reopen in Container"

### Working in the Container

- **Terminal**: All commands run inside the container
- **File System**: Your project files are mounted and editable
- **Extensions**: Pre-configured and working
- **Ports**: Automatically forwarded to your Windows localhost

### Stopping Your Work

**Option 1: Close VS Code/Cursor**
- Container stops automatically
- No data loss (volume persists)

**Option 2: Stop Container from Command Palette**
- `F1` → "Dev Containers: Close Remote Connection"

**PostgreSQL data persists** across sessions via Docker volumes.

---

## Path-Specific Features

### Software Engineering Path

**Pre-installed:**
- Python 3.9 + Flask + SQLAlchemy
- Node.js 18 + npm + create-react-app
- Docker-in-Docker (for Docker lessons on Days 5-6)
- PostgreSQL client

**Ports:**
- 5000: Flask backend
- 3000: React frontend
- 5432: PostgreSQL

**Workflow:**
```bash
# Backend (Flask)
cd backend
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt
flask run

# Frontend (React)
cd frontend
npm install
npm start
```

### Data Analysis Path

**Pre-installed:**
- Python 3.9 + full data science stack
- JupyterLab (auto-starts on port 8888)
- pandas, numpy, matplotlib, seaborn, scikit-learn
- PostgreSQL client

**Pre-loaded Datasets:**
- `/workspaces/kyoto-v1/data/*.csv`
- Sample SQLite database
- Financial data samples

**Workflow:**
```bash
# Start JupyterLab (if not auto-started)
jupyter lab --ip=0.0.0.0 --port=8888 --no-browser

# Work with notebooks
cd /workspaces/kyoto-v1/notebooks
```

---

## FAQ & Troubleshooting

### Docker Desktop Issues

**Problem: "Docker Desktop is not running"**
- **Solution**: Launch Docker Desktop from Start Menu
- Wait for whale icon in system tray to be stable
- Make sure WSL 2 integration is enabled in Settings

**Problem: "Docker daemon is not accessible"**
- **Solution**: Docker Desktop → Settings → General
- Enable "Use the WSL 2 based engine"
- Docker Desktop → Settings → Resources → WSL Integration
- Enable integration for your Ubuntu distro

**Problem: "Not enough memory"**
- **Solution**: Docker Desktop → Settings → Resources
- Increase Memory to at least 4GB (6GB recommended)

### Container Build Issues

**Problem: "Container build fails"**
- **Solution**:
  - Check your internet connection
  - Clear Docker cache: `docker system prune -a`
  - Rebuild: `F1` → "Dev Containers: Rebuild Container"

**Problem: "Extensions not installing"**
- **Solution**:
  - Check VS Code/Cursor extension marketplace connection
  - Manual install: Open Extensions panel, search, install
  - Restart VS Code/Cursor

### Port Conflicts

**Problem: "Port 5432/8888 already in use"**
- **Solution**:
  - Check if you have PostgreSQL/Jupyter running locally
  - Windows: `netstat -ano | findstr :5432`
  - Stop the conflicting service
  - Or change port in `docker-compose.yml`

### Performance Issues

**Problem: "Container is slow"**
- **Solutions**:
  - Don't store project in `/mnt/c/` (Windows drive)
  - Use Docker Desktop file sharing settings
  - Increase RAM allocation in Docker Desktop
  - Close other heavy applications

**Problem: "File changes not detected"**
- **Solution**:
  - This is rare with devcontainers
  - Make sure files are in `/workspaces/` directory
  - Check file permissions

### Git/SSH Issues

**Problem: "Permission denied (publickey)"**
- **Solution**:
  - SSH key generated inside container is separate from Windows
  - Make sure you added the **container's** SSH key to GitHub
  - Re-run: `cat ~/.ssh/id_ed25519.pub` inside container

**Problem: "Git not configured"**
- **Solution**: Run git config commands inside container:
  ```bash
  git config --global user.name "Your Name"
  git config --global user.email "your.email@example.com"
  ```

### Cursor-Specific Questions

**Q: Does Cursor work exactly like VS Code for devcontainers?**
- **A**: Yes! Cursor is a fork of VS Code and uses the same devcontainer system.

**Q: Will my Cursor AI features work in devcontainers?**
- **A**: Yes, Cursor's AI chat and inline features work inside containers.

**Q: Do I need different setup steps for Cursor?**
- **A**: No, all VS Code devcontainer commands work identically in Cursor.

---

## Advanced Tips

### Customizing Your Devcontainer

Edit `.devcontainer/[path]/devcontainer.json`:
- Add extensions to `customizations.vscode.extensions`
- Modify settings in `customizations.vscode.settings`
- Change ports in `forwardPorts`

**Rebuild after changes:**
- `F1` → "Dev Containers: Rebuild Container"

### Using GitHub Codespaces

Your devcontainer configuration works in GitHub Codespaces:
1. Go to your GitHub repository
2. Click "Code" → "Codespaces" → "Create codespace"
3. Choose the devcontainer path
4. Everything works in the browser!

### Switching Between Paths

To switch from SE to DA (or vice versa):
1. Close current remote connection
2. `F1` → "Dev Containers: Open Folder in Container"
3. Select the other `.devcontainer/` folder

### Accessing Windows Files

Your Windows files are accessible at `/mnt/c/` inside the container:
```bash
# Access Windows Documents folder
cd /mnt/c/Users/YourUsername/Documents
```

**Note:** Accessing `/mnt/c/` is slower than `/workspaces/`. Keep your project in `/workspaces/` for best performance.

---

## Next Steps

✅ **Environment ready!** Now:

1. **Complete Day 0 exercises** (skip native tool installation - you're in a container!)
2. **Test sample applications:**
   - SE: Create a Flask hello world
   - DA: Open a Jupyter notebook
3. **Explore the bootcamp curriculum**
4. **Join the bootcamp community**

---

## Getting Help

**Issues with devcontainers?**
1. Check this troubleshooting guide first
2. Search VS Code/Cursor devcontainer docs
3. Ask in bootcamp community channels

**Links:**
- [VS Code Dev Containers Docs](https://code.visualstudio.com/docs/devcontainers/containers)
- [Docker Desktop Docs](https://docs.docker.com/desktop/)
- [Cursor Documentation](https://cursor.sh/docs)

---

**Happy coding! 🚀**
