#!/bin/bash

# Environment Verification Script for Fullstack Bootcamp
# Works on macOS, Linux, WSL2, and devcontainers

set -e

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Track test results
TESTS_PASSED=0
TESTS_FAILED=0
TESTS_WARNING=0

# Print functions
print_success() {
    echo -e "${GREEN}✅ $1${NC}"
    ((TESTS_PASSED++))
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
    ((TESTS_FAILED++))
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
    ((TESTS_WARNING++))
}

print_header() {
    echo ""
    echo "=========================================="
    echo "$1"
    echo "=========================================="
}

# Check if command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Check version meets minimum requirement
version_compare() {
    local version=$1
    local minimum=$2

    # Simple version comparison
    [ "$(printf '%s\n' "$minimum" "$version" | sort -V | head -n1)" = "$minimum" ]
}

# Main verification starts here
echo "🔍 Fullstack Bootcamp - Environment Verification"
echo "=================================================="
echo ""
echo "This script checks your development environment setup."
echo "Running on: $(uname -s) $(uname -m)"
echo ""

# ==========================================
# System Info
# ==========================================
print_header "System Information"

if [ -f /proc/version ]; then
    if grep -qi microsoft /proc/version; then
        echo "📍 Detected: WSL2 (Windows Subsystem for Linux)"
    fi
fi

if [ -f /.dockerenv ]; then
    echo "🐳 Detected: Running inside Docker container"
fi

echo "Shell: $SHELL"
echo "User: $USER"
echo "Home: $HOME"
echo ""

# ==========================================
# Git
# ==========================================
print_header "Git Configuration"

if command_exists git; then
    GIT_VERSION=$(git --version | awk '{print $3}')
    print_success "Git installed: $GIT_VERSION"

    GIT_NAME=$(git config --global user.name 2>/dev/null || echo "")
    GIT_EMAIL=$(git config --global user.email 2>/dev/null || echo "")

    if [ -n "$GIT_NAME" ]; then
        print_success "Git name configured: $GIT_NAME"
    else
        print_warning "Git name not configured. Run: git config --global user.name \"Your Name\""
    fi

    if [ -n "$GIT_EMAIL" ]; then
        print_success "Git email configured: $GIT_EMAIL"
    else
        print_warning "Git email not configured. Run: git config --global user.email \"your.email@example.com\""
    fi

    # Check SSH key
    if [ -f "$HOME/.ssh/id_ed25519" ] || [ -f "$HOME/.ssh/id_rsa" ]; then
        print_success "SSH key exists"

        # Test GitHub connection (timeout after 5 seconds)
        if timeout 5 ssh -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
            print_success "GitHub SSH authentication working"
        else
            print_warning "GitHub SSH not configured or not reachable. Add your SSH key to GitHub."
        fi
    else
        print_warning "No SSH key found. Generate one with: ssh-keygen -t ed25519 -C \"your.email@example.com\""
    fi
else
    print_error "Git not installed. Install Git first."
fi

# ==========================================
# Python
# ==========================================
print_header "Python Environment"

if command_exists python || command_exists python3; then
    PYTHON_CMD="python3"
    if ! command_exists python3; then
        PYTHON_CMD="python"
    fi

    PYTHON_VERSION=$($PYTHON_CMD --version 2>&1 | awk '{print $2}')

    if version_compare "$PYTHON_VERSION" "3.9.0"; then
        print_success "Python installed: $PYTHON_VERSION"
    else
        print_warning "Python version $PYTHON_VERSION found, but 3.9+ recommended"
    fi

    # Check pip
    if command_exists pip || command_exists pip3; then
        PIP_CMD="pip3"
        if ! command_exists pip3; then
            PIP_CMD="pip"
        fi
        PIP_VERSION=$($PIP_CMD --version 2>&1 | awk '{print $2}')
        print_success "pip installed: $PIP_VERSION"
    else
        print_error "pip not installed"
    fi

    # Check virtual environment capability
    if $PYTHON_CMD -m venv --help &> /dev/null; then
        print_success "Python venv module available"
    else
        print_error "Python venv module not available. Install python3-venv."
    fi

    # Check common Python packages
    echo ""
    echo "Checking Python packages..."

    PACKAGES=("flask" "sqlalchemy" "requests" "pytest")
    for package in "${PACKAGES[@]}"; do
        if $PYTHON_CMD -c "import $package" 2>/dev/null; then
            VERSION=$($PYTHON_CMD -c "import $package; print($package.__version__)" 2>/dev/null || echo "unknown")
            print_success "$package installed: $VERSION"
        else
            print_warning "$package not installed (optional, install as needed)"
        fi
    done

    # Check data science packages (for Data Analysis path)
    echo ""
    echo "Checking Data Science packages..."

    DS_PACKAGES=("pandas" "numpy" "matplotlib" "seaborn" "sklearn")
    DS_INSTALLED=0
    for package in "${DS_PACKAGES[@]}"; do
        if $PYTHON_CMD -c "import $package" 2>/dev/null; then
            VERSION=$($PYTHON_CMD -c "import $package; print($package.__version__)" 2>/dev/null || echo "unknown")
            print_success "$package installed: $VERSION"
            ((DS_INSTALLED++))
        fi
    done

    if [ $DS_INSTALLED -eq 0 ]; then
        echo "  (Data science packages not installed - needed for Data Analysis path)"
    fi
else
    print_error "Python not installed. Install Python 3.9+"
fi

# ==========================================
# Node.js (Software Engineering path)
# ==========================================
print_header "Node.js Environment (Software Engineering)"

if command_exists node; then
    NODE_VERSION=$(node --version | sed 's/v//')

    if version_compare "$NODE_VERSION" "16.0.0"; then
        print_success "Node.js installed: $NODE_VERSION"
    else
        print_warning "Node.js version $NODE_VERSION found, but 18+ recommended"
    fi

    # Check npm
    if command_exists npm; then
        NPM_VERSION=$(npm --version)
        print_success "npm installed: $NPM_VERSION"
    else
        print_error "npm not installed"
    fi

    # Check for common global packages
    if command_exists create-react-app || npm list -g create-react-app &> /dev/null; then
        print_success "create-react-app available"
    else
        print_warning "create-react-app not installed globally (optional)"
    fi
else
    print_warning "Node.js not installed (required for Software Engineering path)"
fi

# ==========================================
# Docker
# ==========================================
print_header "Docker Environment"

if command_exists docker; then
    DOCKER_VERSION=$(docker --version | awk '{print $3}' | sed 's/,//')
    print_success "Docker installed: $DOCKER_VERSION"

    # Check if Docker daemon is running
    if docker ps &> /dev/null; then
        print_success "Docker daemon is running"

        # Count running containers
        CONTAINER_COUNT=$(docker ps -q | wc -l | tr -d ' ')
        echo "  Running containers: $CONTAINER_COUNT"

        # Check for PostgreSQL container
        if docker ps --format '{{.Image}}' | grep -q postgres; then
            print_success "PostgreSQL container running"
        else
            print_warning "PostgreSQL container not running. Start with: docker compose up -d postgres"
        fi
    else
        print_error "Docker daemon not running. Start Docker Desktop or service."
    fi

    # Check Docker Compose
    if command_exists docker-compose || docker compose version &> /dev/null; then
        if command_exists docker-compose; then
            COMPOSE_VERSION=$(docker-compose --version | awk '{print $3}' | sed 's/,//')
        else
            COMPOSE_VERSION=$(docker compose version --short)
        fi
        print_success "Docker Compose installed: $COMPOSE_VERSION"
    else
        print_error "Docker Compose not installed"
    fi
else
    print_error "Docker not installed. Install Docker Desktop or Docker Engine."
fi

# ==========================================
# PostgreSQL Client
# ==========================================
print_header "PostgreSQL Client"

if command_exists psql; then
    PSQL_VERSION=$(psql --version | awk '{print $3}')
    print_success "PostgreSQL client (psql) installed: $PSQL_VERSION"

    # Try to connect to local PostgreSQL (if running)
    if pg_isready -h localhost -p 5432 &> /dev/null; then
        print_success "PostgreSQL server accessible on localhost:5432"

        # Try connection with default credentials
        if PGPASSWORD=dev_password psql -h localhost -U postgres -d bootcamp_db -c "SELECT 1;" &> /dev/null; then
            print_success "Connected to bootcamp_db successfully"
        else
            print_warning "Could not connect to bootcamp_db. Check database credentials."
        fi
    else
        print_warning "PostgreSQL not accessible on localhost:5432. Start database with: docker compose up -d postgres"
    fi
else
    print_warning "psql not installed. Install with: sudo apt install postgresql-client (Linux) or brew install postgresql (macOS)"
fi

# ==========================================
# Jupyter (Data Analysis path)
# ==========================================
print_header "Jupyter Environment (Data Analysis)"

if command_exists jupyter; then
    JUPYTER_VERSION=$(jupyter --version 2>&1 | grep "jupyter core" | awk '{print $NF}')
    print_success "Jupyter installed: $JUPYTER_VERSION"

    if command_exists jupyter-lab; then
        JUPYTERLAB_VERSION=$(jupyter-lab --version 2>&1)
        print_success "JupyterLab installed: $JUPYTERLAB_VERSION"
    else
        print_warning "JupyterLab not installed (optional, but recommended)"
    fi
else
    print_warning "Jupyter not installed (required for Data Analysis path)"
fi

# ==========================================
# Sample Data Files
# ==========================================
print_header "Sample Data Files"

DATA_DIR="$(dirname "$0")/../data"
if [ -d "$DATA_DIR" ]; then
    print_success "Data directory found: $DATA_DIR"

    # Check for expected datasets
    DATASETS=("titanic.csv" "iris.csv" "stocks_sample.csv" "sample_db.sqlite")
    for dataset in "${DATASETS[@]}"; do
        if [ -f "$DATA_DIR/$dataset" ]; then
            SIZE=$(du -h "$DATA_DIR/$dataset" | awk '{print $1}')
            print_success "$dataset exists ($SIZE)"
        else
            print_warning "$dataset not found"
        fi
    done
else
    print_warning "Data directory not found at $DATA_DIR"
fi

# ==========================================
# Notebooks Directory (Data Analysis)
# ==========================================
print_header "Notebook Files (Data Analysis)"

NOTEBOOKS_DIR="$(dirname "$0")/../notebooks"
if [ -d "$NOTEBOOKS_DIR" ]; then
    print_success "Notebooks directory found: $NOTEBOOKS_DIR"

    NOTEBOOK_COUNT=$(find "$NOTEBOOKS_DIR" -name "*.ipynb" 2>/dev/null | wc -l | tr -d ' ')
    if [ "$NOTEBOOK_COUNT" -gt 0 ]; then
        print_success "Found $NOTEBOOK_COUNT notebook files"
    else
        print_warning "No notebook files found"
    fi
else
    print_warning "Notebooks directory not found at $NOTEBOOKS_DIR"
fi

# ==========================================
# Summary
# ==========================================
print_header "Verification Summary"

TOTAL_TESTS=$((TESTS_PASSED + TESTS_FAILED + TESTS_WARNING))

echo ""
echo "Total checks: $TOTAL_TESTS"
echo -e "${GREEN}✅ Passed: $TESTS_PASSED${NC}"
echo -e "${YELLOW}⚠️  Warnings: $TESTS_WARNING${NC}"
echo -e "${RED}❌ Failed: $TESTS_FAILED${NC}"
echo ""

if [ $TESTS_FAILED -eq 0 ]; then
    echo -e "${GREEN}🎉 Environment verification complete!${NC}"
    echo ""
    echo "Your environment is ready for the bootcamp."
    echo ""
    echo "Next steps:"
    echo "  1. If you have warnings, address them before starting"
    echo "  2. Review Day 0 setup guide if needed"
    echo "  3. Start with Day 1: Git Setup"
    echo ""
    exit 0
else
    echo -e "${RED}⚠️  Some checks failed.${NC}"
    echo ""
    echo "Please address the failed checks above before continuing."
    echo "Refer to the setup guides for help:"
    echo "  - docs/day_0_environment_setup.md (macOS/Linux)"
    echo "  - docs/devcontainer_setup.md (Windows - Devcontainer)"
    echo "  - docs/windows_setup_guide.md (Windows - WSL2)"
    echo ""
    exit 1
fi
