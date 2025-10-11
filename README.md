# light-ts-env

`light-ts-env` est un environnement de développement léger pour TypeScript basé sur Docker.  
Il permet de compiler et d'exécuter facilement du code `.ts` dans un conteneur isolé, prêt à l'emploi.

---

## Image Docker

**Lien direct vers l’image sur Docker Hub :** [ts-slim](https://hub.docker.com/r/mess09/ts-slim)

### Pull de l’image à partir de Docker Hub

```bash
docker pull mess09/ts-slim
```

## 📦 Contenu du Dockerfile

- Basé sur `node:20-slim`
- Installation globale de :
  - `typescript`
  - `ts-node`
- Création d'un utilisateur dédié (`toto`)
- Création automatique de la structure de projet :  
  `/home/toto/ts/src/`
- Un fichier `file1.ts` vide
- Un fichier `tsconfig.json` copié dans `src/`
- Travail directement dans `/home/toto/ts/src`
- Lancement automatique dans un shell bash en tant que `toto`

---

## 🚀 Installation et Utilisation

### 1. Cloner le projet

```bash
git clone https://github.com/messaoudRm/light-ts-env.git
cd light-ts-env
```

### 2. Construire l'image Docker

```bash
docker build -t ts-slim .
```

### 3. Lancer un conteneur

```bash
docker run -it ts-slim
```

Vous serez automatiquement placé dans le dossier `/home/toto/ts/src` prêt à coder.

---

## ✨ Exemple rapide

Dans le conteneur :

```bash
ts-node file1.ts
```

✅ Résultat : affichage de `Hello World from TypeScript` directement !

---

## 📂 Structure du projet

```
/home/toto/ts/
│
└── src/
    ├── file1.ts       # Fichier TypeScript contenant "console.log('Hello World from TypeScript');"
    └── tsconfig.json  # Configuration TypeScript
```

---

## 📊 Taille de l'image et du conteneur

### Taille de l'image Docker (`ts-slim`)

- **Taille** : 228MB  
  Cette taille correspond à la quantité d'espace disque utilisée par l'image Docker `ts-slim` que tu as construite.

### Taille du conteneur Docker

- **Taille réelle** : 2.32MB  
  Cela correspond à l'espace disque utilisé actuellement par le conteneur en cours d'exécution.
- **Taille virtuelle** : 231MB  
  La "taille virtuelle" inclut les couches partagées avec l'image, donc l'ensemble des données du conteneur (image + modifications).

---

## 🛠 Notes Techniques

- Mot de passe root par défaut : `ts-su-pass`
- `npm cache` et `apt lists` sont nettoyés pour garder l'image légère.
- Dossier de travail configuré pour simplifier les commandes.
