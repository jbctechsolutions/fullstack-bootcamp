#!/bin/bash

# Post-create setup script for Software Engineering devcontainer

echo "🚀 Setting up Software Engineering environment..."

# Check if Git is configured
if [ -z "$(git config --global user.name)" ]; then
    echo ""
    echo "📝 Git configuration needed!"
    echo "Please run these commands to configure Git:"
    echo "  git config --global user.name \"Your Name\""
    echo "  git config --global user.email \"your.email@example.com\""
    echo ""
fi

# Create common directories if they don't exist
mkdir -p ~/projects

# Install npm global tools
npm install -g create-react-app

# Display helpful information
echo ""
echo "✅ Software Engineering environment ready!"
echo ""
echo "📦 Installed tools:"
echo "  - Python $(python --version 2>&1 | cut -d' ' -f2)"
echo "  - Node.js $(node --version)"
echo "  - npm $(npm --version)"
echo "  - Docker $(docker --version 2>&1 | cut -d' ' -f3 | cut -d',' -f1)"
echo "  - PostgreSQL client $(psql --version | cut -d' ' -f3)"
echo ""
echo "🗄️  PostgreSQL database:"
echo "  - Host: localhost"
echo "  - Port: 5432"
echo "  - Database: bootcamp_db"
echo "  - User: postgres"
echo "  - Password: dev_password"
echo ""
echo "🔗 Connection string:"
echo "  postgresql://postgres:dev_password@localhost:5432/bootcamp_db"
echo ""
echo "📚 Next steps:"
echo "  1. Configure Git (see above)"
echo "  2. Generate SSH key: ssh-keygen -t ed25519 -C \"your.email@example.com\""
echo "  3. Add SSH key to GitHub"
echo "  4. Start coding!"
echo ""
