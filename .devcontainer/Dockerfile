FROM debian:12-slim

# Basic tools + build deps so uv can install Python and compile wheels if needed
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    git \
    sudo \
    build-essential \
    pkg-config \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Create 'vscode' user similar to official devcontainers
RUN useradd -m vscode && echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Install uv via official installer (no system Python required)
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Make uv visible for all users
ENV PATH="/root/.cargo/bin:${PATH}"

# Switch to non-root user and set a generic workspace root
USER vscode
WORKDIR /workspaces
