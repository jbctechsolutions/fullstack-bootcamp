# Windows Setup Guide - Hybrid Approach (WSL2 + Docker)

## Overview

This guide walks you through setting up a **hybrid development environment** on Windows using WSL2 (Windows Subsystem for Linux). This is the **advanced path** that gives you a native Linux development experience while running Windows.

## When to Use This Guide

**Choose this hybrid approach if:**
- You want to understand native tool installation
- You prefer working in a Linux terminal environment
- You're not using VS Code or Cursor as your primary editor
- You want more control over your development setup
- You're comfortable with command-line configuration

**Consider the devcontainer approach if:**
- You want the quickest setup (5-10 minutes)
- You use VS Code or Cursor
- You prefer pre-configured environments
- See [Devcontainer Setup Guide](devcontainer_setup.md)

---

## Approach Comparison

| Aspect | Hybrid (WSL2) | Devcontainer |
|--------|---------------|--------------|
| **Setup Time** | 30-45 minutes | 5-10 minutes |
| **Complexity** | Moderate | Low |
| **Control** | Full control over tools | Pre-configured |
| **Learning** | Learn native installation | Focus on coding |
| **Editor** | Any editor | VS Code/Cursor recommended |
| **Updates** | Manual | Automatic on rebuild |

---

## Prerequisites

### System Requirements
- **Windows 10** (build 19041 or higher) **or Windows 11**
- **Administrator access** (needed for WSL2 installation)
- **Virtualization enabled** in BIOS (usually enabled by default)
- **At least 8GB RAM** (16GB recommended)
- **20GB free disk space**

### Check Windows Version

Open **PowerShell** and run:
```powershell
winver
```

Ensure build number is **19041** or higher.

---

## Part 1: WSL2 Installation

### Step 1: Enable WSL

Open **PowerShell as Administrator** (Start → PowerShell → Right-click → Run as Administrator):

```powershell
# Enable WSL feature
wsl --install

# This command:
# - Enables WSL and Virtual Machine Platform
# - Downloads and installs Ubuntu (default distribution)
# - Sets WSL 2 as the default version
```

**Restart your computer** when prompted.

### Step 2: Complete Ubuntu Setup

After restart, **Ubuntu** will launch automatically:

1. Wait for installation to complete (1-2 minutes)
2. **Create a username** (lowercase, no spaces)
3. **Create a password** (you'll need this for `sudo` commands)
4. **Remember these credentials!**

Example:
```
Enter new UNIX username: johnsmith
New password: ********
Retype new password: ********
```

### Step 3: Verify WSL2 Installation

Open **PowerShell** (doesn't need to be Administrator):

```powershell
# Check WSL version
wsl --list --verbose

# Should show:
#   NAME      STATE           VERSION
#   Ubuntu    Running         2
```

If VERSION shows **1**, upgrade to WSL 2:
```powershell
wsl --set-version Ubuntu 2
wsl --set-default-version 2
```

### Step 4: Update Ubuntu

Launch **Ubuntu** from Start Menu and run:

```bash
# Update package lists
sudo apt update

# Upgrade installed packages
sudo apt upgrade -y

# Install essential build tools
sudo apt install -y build-essential curl wget git
```

---

## Part 2: File System Best Practices

### Understanding WSL2 File Systems

WSL2 has **two file systems**:

1. **Linux filesystem** (`/home/username/`)
   - ✅ **Use this for projects**
   - Fast performance
   - Native Linux paths

2. **Windows filesystem** (`/mnt/c/Users/YourName/`)
   - ⚠️ Accessible but slower
   - Cross-platform compatibility
   - Backup and sync easier

### Best Practices

**DO:**
```bash
# Store projects in Linux filesystem
cd ~
mkdir projects
cd projects
git clone git@github.com:your-org/fullstack-bootcamp.git
```

**DON'T:**
```bash
# Avoid working in /mnt/c/ for development
cd /mnt/c/Users/YourName/Documents/projects  # SLOW!
```

### Accessing Files Between Windows and WSL2

**From Windows Explorer:**
- Type in address bar: `\\wsl$\Ubuntu\home\yourusername\`
- Bookmark this location for easy access

**From WSL2 terminal:**
```bash
# Access Windows C: drive
cd /mnt/c/Users/YourName/Documents

# Copy files from Windows to WSL2
cp /mnt/c/Users/YourName/file.txt ~/projects/
```

---

## Part 3: Development Tools Setup

### Exercise 1: Git Installation & Configuration

#### Installation

Git comes pre-installed in modern WSL2 Ubuntu. Verify:

```bash
git --version
# Should show 2.x.x or higher
```

If not installed:
```bash
sudo apt update
sudo apt install git -y
```

#### Configuration

```bash
# Set your identity
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"

# Verify
git config --list
```

#### SSH Key Setup

```bash
# Generate SSH key
ssh-keygen -t ed25519 -C "your.email@example.com"

# Press Enter to accept default location (~/.ssh/id_ed25519)
# Enter a passphrase (recommended) or leave empty

# Start ssh-agent
eval "$(ssh-agent -s)"

# Add key to agent
ssh-add ~/.ssh/id_ed25519

# Display public key
cat ~/.ssh/id_ed25519.pub
```

**Add to GitHub:**
1. Copy the output from `cat ~/.ssh/id_ed25519.pub`
2. Go to GitHub → Settings → SSH Keys → New SSH Key
3. Paste and save

**Test connection:**
```bash
ssh -T git@github.com
# Should show: "Hi username! You've successfully authenticated..."
```

---

### Exercise 2: Python Environment Setup

#### Install pyenv (Python Version Manager)

```bash
# Install dependencies
sudo apt update
sudo apt install -y make build-essential libssl-dev zlib1g-dev \
  libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
  libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev \
  libffi-dev liblzma-dev

# Install pyenv
curl https://pyenv.run | bash

# Add to shell configuration
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc

# Reload shell configuration
source ~/.bashrc
```

#### Install Python

```bash
# Install Python 3.9.18
pyenv install 3.9.18

# Set as global default
pyenv global 3.9.18

# Verify
python --version
# Should show: Python 3.9.18
```

#### Create Virtual Environment

```bash
# Navigate to project
cd ~/projects/fullstack-bootcamp/kyoto-v1

# Create virtual environment
python -m venv venv

# Activate virtual environment
source venv/bin/activate

# Your prompt should now show (venv)

# Install common packages
pip install --upgrade pip
pip install flask python-dotenv sqlalchemy psycopg2-binary pytest
```

#### Deactivate Virtual Environment

```bash
deactivate
```

---

### Exercise 3: Node.js Setup

#### Install nvm (Node Version Manager)

```bash
# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# Add to shell configuration (if not auto-added)
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.bashrc
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.bashrc

# Reload shell
source ~/.bashrc
```

#### Install Node.js

```bash
# Install LTS version
nvm install --lts

# Use LTS version
nvm use --lts

# Set LTS as default
nvm alias default 'lts/*'

# Verify
node --version  # Should show v18.x.x or similar
npm --version   # Should show compatible version
```

#### Configure npm

```bash
# Set defaults
npm config set init-author-name "Your Name"
npm config set init-author-email "your.email@example.com"
npm config set init-license "MIT"

# Verify
npm config list
```

---

### Exercise 4: Docker Desktop Setup

#### Download and Install

1. Download Docker Desktop from: https://www.docker.com/products/docker-desktop/
2. Run the installer
3. **Important:** During installation, select **"Use WSL 2 instead of Hyper-V"**
4. Restart computer when prompted

#### Configure Docker Desktop for WSL2

1. Launch **Docker Desktop**
2. Go to **Settings** (gear icon)
3. Navigate to **General**:
   - ✅ **"Use the WSL 2 based engine"**
4. Navigate to **Resources** → **WSL Integration**:
   - ✅ **"Enable integration with my default WSL distro"**
   - ✅ **Enable "Ubuntu"** (or your distro name)
5. Click **"Apply & Restart"**

#### Verify Docker in WSL2

Open **Ubuntu** terminal:

```bash
# Check Docker version
docker --version
docker compose version

# Test Docker
docker run hello-world

# Should download image and show "Hello from Docker!"
```

#### Set Docker Memory (Optional but Recommended)

Docker Desktop → **Settings** → **Resources**:
- **Memory:** 6GB (or more)
- **CPUs:** Half of your CPU cores
- **Disk:** 20GB+

---

### Exercise 5: PostgreSQL via Docker

Instead of installing PostgreSQL natively, we'll use Docker (recommended).

#### Create docker-compose.yml

In your project root (`~/projects/fullstack-bootcamp/kyoto-v1/`):

```bash
# Make sure you're in project root
cd ~/projects/fullstack-bootcamp/kyoto-v1
```

The root `docker-compose.yml` should already exist (created by this setup), but if not:

```bash
cat > docker-compose.yml << 'EOF'
version: '3.8'

services:
  postgres:
    image: postgres:15-alpine
    container_name: bootcamp_postgres
    restart: unless-stopped
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: dev_password
      POSTGRES_DB: bootcamp_db
    ports:
      - "5432:5432"
    volumes:
      - pgdata:/var/lib/postgresql/data
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres"]
      interval: 10s
      timeout: 5s
      retries: 5

volumes:
  pgdata:
EOF
```

#### Start PostgreSQL

```bash
# Start database (runs in background)
docker compose up -d postgres

# Check status
docker compose ps

# Should show postgres running on port 5432
```

#### Install PostgreSQL Client Tools

```bash
# Install psql client (to interact with database)
sudo apt install -y postgresql-client

# Test connection
psql -h localhost -U postgres -d bootcamp_db
# Password: dev_password

# You should see:
# bootcamp_db=#

# Type \q to quit
```

#### Stop/Restart PostgreSQL

```bash
# Stop
docker compose down

# Start
docker compose up -d

# View logs
docker compose logs -f postgres
```

---

### Exercise 6: VS Code / Cursor Setup

#### Option A: VS Code

**Download and Install:**
1. Download from https://code.visualstudio.com/
2. Run installer (install for **all users** recommended)
3. Check **"Add to PATH"** during installation

**Install Remote-WSL Extension:**

From **PowerShell** or **Ubuntu**:
```bash
code --install-extension ms-vscode-remote.remote-wsl
```

Or manually:
1. Open VS Code
2. Extensions → Search "Remote - WSL"
3. Install "Remote - WSL" by Microsoft

**Open Project in WSL:**

From Ubuntu terminal:
```bash
cd ~/projects/fullstack-bootcamp/kyoto-v1
code .
```

VS Code will:
- Install VS Code Server in WSL2 (first time only)
- Open the project
- Show "WSL: Ubuntu" in bottom-left corner

**Install Additional Extensions in WSL:**

Once VS Code is connected to WSL, install:
```bash
code --install-extension ms-python.python
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension ms-azuretools.vscode-docker
code --install-extension eamodio.gitlens
code --install-extension github.copilot
```

#### Option B: Cursor

**Download and Install:**
1. Download from https://cursor.sh/
2. Run installer
3. Check **"Add to PATH"**

**Remote-WSL Support:**

Cursor has built-in WSL support (same as VS Code):

**Open Project in WSL:**

From Ubuntu terminal:
```bash
cd ~/projects/fullstack-bootcamp/kyoto-v1
cursor .
```

Or from Windows:
1. Open Cursor
2. `Ctrl+Shift+P` → "Remote-WSL: Open Folder in WSL"
3. Navigate to project

**Install Extensions:**

Same as VS Code - install from Extensions panel while connected to WSL.

---

## Part 4: PostgreSQL via Docker (Covered in Exercise 5)

See **Exercise 5** above for complete PostgreSQL setup using Docker.

**Connection Details:**
- **Host:** localhost
- **Port:** 5432
- **Database:** bootcamp_db
- **User:** postgres
- **Password:** dev_password
- **Connection String:** `postgresql://postgres:dev_password@localhost:5432/bootcamp_db`

---

## Part 5: Verification

### Run Verification Script

The bootcamp includes a verification script:

```bash
cd ~/projects/fullstack-bootcamp/kyoto-v1
bash scripts/verify_environment.sh
```

**Expected Output:**
```
✅ Git installed and configured
✅ Python 3.9.18 installed
✅ Node.js 18.x.x installed
✅ Docker running
✅ PostgreSQL accessible
✅ All checks passed!
```

### Manual Verification

#### Check All Tools

```bash
# System
uname -a                  # Linux kernel version
lsb_release -a           # Ubuntu version

# Version control
git --version
git config --list

# Python
python --version
pip --version
pyenv versions

# Node.js
node --version
npm --version
nvm list

# Docker
docker --version
docker compose version
docker ps

# PostgreSQL
psql --version
psql -h localhost -U postgres -c "SELECT version();"
```

#### Test Python Packages

```bash
# Activate venv
cd ~/projects/fullstack-bootcamp/kyoto-v1
source venv/bin/activate

# Test imports
python << EOF
import flask
import sqlalchemy
import psycopg2
print("All Python packages working!")
EOF
```

#### Test Node.js

```bash
# Create test React app
npx create-react-app test-app

# Should succeed without errors
```

---

## Part 6: Daily Workflow

### Opening Your Terminal

**Option 1: Windows Terminal (Recommended)**
1. Install from Microsoft Store: "Windows Terminal"
2. Open → Dropdown → Ubuntu
3. Sets Ubuntu as default profile

**Option 2: Ubuntu from Start Menu**
- Start → Search "Ubuntu" → Click

**Option 3: From VS Code/Cursor**
- Terminal → New Terminal (automatically opens in WSL)

### Starting Services

```bash
# Navigate to project
cd ~/projects/fullstack-bootcamp/kyoto-v1

# Start PostgreSQL
docker compose up -d postgres

# Activate Python venv (if needed)
source venv/bin/activate
```

### Working on Projects

```bash
# Backend (Flask)
cd ~/projects/fullstack-bootcamp/kyoto-v1/backend
source venv/bin/activate
flask run

# Frontend (React)
cd ~/projects/fullstack-bootcamp/kyoto-v1/frontend
npm start
```

### Stopping Services

```bash
# Stop PostgreSQL
docker compose down

# Deactivate Python venv
deactivate
```

### Switching Between Windows and Linux

**Access Windows files:**
```bash
cd /mnt/c/Users/YourName/Documents
```

**Access Linux files from Windows:**
- File Explorer → Address bar → `\\wsl$\Ubuntu\home\yourusername\`

---

## Troubleshooting

### WSL2 Issues

**Problem: "WSL 2 requires an update to its kernel component"**
- **Solution**: Download and install: https://aka.ms/wsl2kernel

**Problem: "Virtualization is not enabled"**
- **Solution**:
  - Restart computer
  - Enter BIOS (usually F2, F10, or Del during boot)
  - Enable "Intel VT-x" or "AMD-V"
  - Save and exit

**Problem: "The system cannot find the file specified"**
- **Solution**: Reinstall WSL:
  ```powershell
  wsl --unregister Ubuntu
  wsl --install -d Ubuntu
  ```

### Docker Desktop Integration

**Problem: "Cannot connect to Docker daemon"**
- **Solution**:
  1. Make sure Docker Desktop is running (check system tray)
  2. Docker Desktop → Settings → Resources → WSL Integration
  3. Enable for Ubuntu
  4. Restart Docker Desktop

**Problem: "Docker containers are slow"**
- **Solution**:
  1. Use Linux filesystem (not `/mnt/c/`)
  2. Increase Docker memory (Settings → Resources)
  3. Update Docker Desktop to latest version

### Permission Issues

**Problem: "Permission denied" errors**
- **Solution**:
  ```bash
  # Fix file permissions
  chmod +x filename.sh

  # Fix ownership
  sudo chown -R $USER:$USER ~/projects
  ```

**Problem: "Cannot access /mnt/c/ files"**
- **Solution**: Make sure Windows drives are mounted:
  ```bash
  ls /mnt/c/
  # If empty, restart WSL: wsl --shutdown (in PowerShell)
  ```

### Network/DNS Problems

**Problem: "Could not resolve host"**
- **Solution**: Edit `/etc/resolv.conf`:
  ```bash
  sudo nano /etc/resolv.conf

  # Add:
  nameserver 8.8.8.8
  nameserver 8.8.4.4
  ```

**Problem: "Port already in use"**
- **Solution**:
  ```bash
  # Find process using port
  sudo lsof -i :5432

  # Kill process
  kill -9 PID
  ```

### pyenv / Python Issues

**Problem: "pyenv: command not found"**
- **Solution**: Reload shell config:
  ```bash
  source ~/.bashrc
  ```

**Problem: "Python build failed"**
- **Solution**: Install missing dependencies:
  ```bash
  sudo apt install -y libssl-dev libffi-dev libsqlite3-dev
  pyenv install 3.9.18
  ```

### VS Code / Cursor Issues

**Problem: "VS Code Server failed to start"**
- **Solution**:
  ```bash
  # Remove VS Code Server
  rm -rf ~/.vscode-server

  # Reopen in VS Code
  code .
  ```

**Problem: "Extensions not working in WSL"**
- **Solution**: Install extensions **while connected to WSL**
- Check bottom-left corner shows "WSL: Ubuntu"

---

## Additional Resources

### Official Documentation
- [WSL2 Documentation](https://docs.microsoft.com/en-us/windows/wsl/)
- [Docker Desktop WSL2 Backend](https://docs.docker.com/desktop/wsl/)
- [VS Code Remote-WSL](https://code.visualstudio.com/docs/remote/wsl)
- [Cursor Documentation](https://cursor.sh/docs)

### Learning Resources
- [Git Documentation](https://git-scm.com/doc)
- [Python Documentation](https://docs.python.org/)
- [Node.js Documentation](https://nodejs.org/docs/)
- [Docker Documentation](https://docs.docker.com/)

### Community
- WSL GitHub: https://github.com/microsoft/WSL
- Docker Desktop: https://github.com/docker/for-win

---

## Next Steps

✅ **Environment ready!** Now:

1. Complete **Day 0** exercises from the bootcamp curriculum
2. You can skip native tool installation steps (already done!)
3. Follow along with Day 1 Git exercises
4. Start building your first project!

---

**Congratulations on setting up your Windows development environment! 🎉**

You now have a professional, Linux-based development setup running on Windows with full Docker support. This is the same environment used by many professional developers.
