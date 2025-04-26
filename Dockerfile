FROM node:20-slim

# Installer utilitaires nécessaires et TypeScript + ts-node globalement
RUN apt-get update && apt-get install -y \
    passwd \
    && npm install -g typescript ts-node \
    && npm cache clean --force \
    && rm -rf /var/lib/apt/lists/*

# Définir un mot de passe pour root
RUN echo "root:ts-su-pass" | chpasswd

# Créer l'utilisateur "toto" avec son dossier perso, et ajouter un fichier TypeScript Hello World
RUN useradd -ms /bin/bash toto \
    && mkdir -p /home/toto/ts/src \
    && touch /home/toto/ts/src/file1.ts \
    && echo "console.log('Hello World from TypeScript');" >> /home/toto/ts/src/file1.ts \
    && chown -R toto:toto /home/toto

# Copier le fichier tsconfig.json dans /home/toto/ts/src/
COPY tsconfig.json /home/toto/ts/src/

# Définit le dossier de travail
WORKDIR /home/toto/ts/src

# Passer à l'utilisateur toto
USER toto

# Démarrer dans bash
CMD ["bash"]