# ===============================
# Étape 1 : Build des assets avec Vite
# ===============================
FROM node:18-alpine AS vite-builder

WORKDIR /app

# Copier les fichiers nécessaires
COPY package*.json vite.config.* ./
RUN npm install

# Copier les sources du frontend
COPY resources ./resources
COPY public ./public

# Compiler les assets avec Vite
RUN npm run build

# ===============================
# Étape 2 : Base Laravel + PHP
# ===============================
FROM php:8.2-fpm-alpine

# Dépendances système nécessaires
RUN apk update && apk add --no-cache \
    libpq-dev \
    libzip-dev \
    unzip \
    git \
    curl \
    bash \
    && docker-php-ext-install pdo pdo_pgsql zip

# Installer Composer depuis une image officielle
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Définir le dossier de travail
WORKDIR /var/www

# Copier tous les fichiers Laravel
COPY . .

# Créer un fichier .env (ou le copier s’il existe)
RUN cp .env.example .env

# Installer les dépendances PHP de Laravel
RUN composer install --no-dev --optimize-autoloader

# Copier les assets compilés avec Vite
COPY --from=vite-builder /app/public/build ./public/build

# Donne les bonnes permissions (facultatif mais recommandé)
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 storage bootstrap/cache

# Variables d'environnement
ENV APP_ENV=production
ENV APP_DEBUG=false

# Expose le port Laravel (artisan serve)
EXPOSE 8000

# Commande de démarrage
CMD ["sh", "-c", "php artisan config:cache && php artisan migrate --force && php artisan serve --host=0.0.0.0 --port=8000"]

