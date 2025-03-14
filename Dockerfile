# Étape 1 : Utiliser une image Node.js compatible (10.16.3)
FROM node:10.16.3 AS build

# Définir le répertoire de travail
WORKDIR /app

# Copier le package.json et installer les dépendances
COPY package*.json ./ 
RUN npm install

# Copier le reste des fichiers du projet
COPY . .

# Construire l'application Angular
RUN npm run build --prod || npm run build --force

# Étape 2 : Utiliser Nginx pour servir l'application
FROM nginx:latest

# 🔥 Correction ici : Copier uniquement le dossier `dist/angular-app/`
COPY --from=build /app/dist/angular-app/. /usr/share/nginx/html

# Exposer le port 80
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
