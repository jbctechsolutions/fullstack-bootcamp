# Use Jupyter's scipy-notebook as base (includes pandas, numpy, matplotlib, scikit-learn)
FROM jupyter/scipy-notebook:latest

# Switch to root to install system packages
USER root

# Install PostgreSQL client and other system dependencies
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    postgresql-client \
    build-essential \
    libpq-dev \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Switch back to jovyan user
USER jovyan

# Install additional Python packages not in scipy-notebook
RUN pip install --no-cache-dir \
    jupyterlab \
    sqlalchemy \
    psycopg2-binary \
    requests \
    yfinance \
    pandas-datareader \
    seaborn \
    black \
    pylint

# Configure JupyterLab
RUN jupyter lab --generate-config && \
    echo "c.ServerApp.token = ''" >> ~/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.password = ''" >> ~/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.allow_origin = '*'" >> ~/.jupyter/jupyter_lab_config.py && \
    echo "c.ServerApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_lab_config.py

# Set up bash completion for better CLI experience
RUN echo 'if [ -f /etc/bash_completion ]; then . /etc/bash_completion; fi' >> ~/.bashrc
