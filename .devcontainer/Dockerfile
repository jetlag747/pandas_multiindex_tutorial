FROM debian:12-slim

# 1) Install base tools and build deps as root
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    git \
    sudo \
    build-essential \
    pkg-config \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# 2) Create 'vscode' user similar to official devcontainers
RUN useradd -m vscode && echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 3) Switch to vscode and install uv for that user
USER vscode
WORKDIR /workspaces

RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# 4) Put uv (installed under /home/vscode/.cargo/bin) into PATH
ENV PATH="/home/vscode/.cargo/bin:${PATH}"
