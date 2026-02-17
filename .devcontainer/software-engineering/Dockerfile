# Use Microsoft's official Python devcontainer base image
FROM mcr.microsoft.com/devcontainers/python:1-3.9-bullseye

# Install system dependencies for Python packages and PostgreSQL client
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    postgresql-client \
    build-essential \
    libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Python tools
RUN pip install --upgrade pip setuptools wheel \
    && pip install black pylint pytest pytest-cov flask python-dotenv sqlalchemy psycopg2-binary alembic

# Set up bash completion for better CLI experience
RUN echo 'if [ -f /etc/bash_completion ]; then . /etc/bash_completion; fi' >> /home/vscode/.bashrc
