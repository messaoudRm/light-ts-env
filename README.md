# light-ts-env

`light-ts-env` est un environnement de développement léger pour TypeScript basé sur Docker.  
Il permet de compiler et d'exécuter facilement du code `.ts` dans un conteneur isolé, prêt à l'emploi.

---

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
git clone https://github.com/ton_pseudo/light-ts-env.git
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
    ├── file1.ts       # Fichier TypeScript vide
    └── tsconfig.json  # Configuration TypeScript
```

---

## 🛠 Notes Techniques

- Mot de passe root par défaut : `ts-su-pass`
- `npm cache` et `apt lists` sont nettoyés pour garder l'image légère.
- Dossier de travail configuré pour simplifier les commandes.
