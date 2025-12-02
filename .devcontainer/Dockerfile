FROM mcr.microsoft.com/devcontainers/base:bookworm
# 1. Copier uv depuis l'image officielle (méthode la plus propre)
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

# 2. Pré-installer Python 3.12 (ou la version de votre choix)
# Cela garantit que Python est présent AVANT que VS Code ne se lance.
ENV UV_LINK_MODE=copy
RUN uv python install 3.12

# 3. Créer le venv préventivement pour que VS Code le trouve tout de suite
# On le met dans un dossier standard accessible
WORKDIR /home/vscode
USER vscode
RUN uv venv .venv --python 3.12

# Retour à la racine pour l'usage normal
WORKDIR /workspaces