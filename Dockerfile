# On part d'une image Debian très légère (bookworm-slim)
FROM debian:bookworm-slim

# Éviter les intéractions pendant l'installation de paquets
ENV DEBIAN_FRONTEND=noninteractive

# 1. Mise à jour et installation des dépendances minimales (curl pour télécharger uv, git pour le code)
# Nous nettoyons le cache apt juste après pour garder l'image petite.
RUN apt-get update && apt-get install -y \
    curl \
    git \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# 2. Installation de UV
# On utilise le script d'installation officiel
ADD https://astral.sh/uv/install.sh /install.sh
RUN chmod +x /install.sh && /install.sh && rm /install.sh

# 3. Configuration de l'environnement
# On ajoute le binaire uv au PATH
ENV PATH="/root/.cargo/bin:$PATH"

# 4. (Optionnel) Configuration pour l'activation automatique dans le terminal
# Cela force le terminal bash à activer l'environnement virtuel .venv s'il existe à l'ouverture
RUN echo 'if [ -f "/workspaces/project/.venv/bin/activate" ]; then source /workspaces/project/.venv/bin/activate; fi' >> /root/.bashrc
