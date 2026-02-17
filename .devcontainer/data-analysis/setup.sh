#!/bin/bash

# Post-create setup script for Data Analysis devcontainer

echo "📊 Setting up Data Analysis environment..."

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

# Verify sample datasets are accessible
if [ -d "/workspaces/kyoto-v1/data" ]; then
    echo "✅ Sample datasets found:"
    ls -lh /workspaces/kyoto-v1/data/*.csv 2>/dev/null | awk '{print "   -", $9, "(" $5 ")"}'
fi

# Display helpful information
echo ""
echo "✅ Data Analysis environment ready!"
echo ""
echo "📦 Installed Python packages:"
python -c "import pandas; print(f'  - pandas {pandas.__version__}')"
python -c "import numpy; print(f'  - numpy {numpy.__version__}')"
python -c "import matplotlib; print(f'  - matplotlib {matplotlib.__version__}')"
python -c "import seaborn; print(f'  - seaborn {seaborn.__version__}')"
python -c "import sklearn; print(f'  - scikit-learn {sklearn.__version__}')"
python -c "import sqlalchemy; print(f'  - sqlalchemy {sqlalchemy.__version__}')"
echo ""
echo "🗄️  PostgreSQL database:"
echo "  - Host: localhost"
echo "  - Port: 5432"
echo "  - Database: bootcamp_db"
echo "  - User: postgres"
echo "  - Password: dev_password"
echo ""
echo "🔗 Connection string (SQLAlchemy):"
echo "  postgresql://postgres:dev_password@localhost:5432/bootcamp_db"
echo ""
echo "📓 JupyterLab:"
echo "  - Access at: http://localhost:8888"
echo "  - No token required (development mode)"
echo "  - Notebooks directory: /workspaces/kyoto-v1/notebooks"
echo ""
echo "📚 Next steps:"
echo "  1. Configure Git (see above)"
echo "  2. Generate SSH key: ssh-keygen -t ed25519 -C \"your.email@example.com\""
echo "  3. Add SSH key to GitHub"
echo "  4. Open JupyterLab at http://localhost:8888"
echo "  5. Start exploring data!"
echo ""
