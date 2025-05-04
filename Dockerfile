# Étape 1 : construction du frontend avec Vite
FROM node:18-alpine AS vite-builder

WORKDIR /app

# Copier seulement les fichiers nécessaires pour le build vite
COPY package*.json vite.config.* resources/ ./ 
RUN npm install
COPY resources ./resources
COPY public ./public

# Build des assets Vite
RUN npm run build

# Étape 2 : base Laravel + PHP
FROM php:8.2-fpm-alpine

# Installer les extensions nécessaires
RUN apk update && apk install -y \
    libpq-dev libzip-dev unzip git curl \
    && docker-php-ext-install pdo pdo_pgsql zip

# Installer Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Définir le dossier de travail
WORKDIR /var/www

# Copier les fichiers Laravel
COPY . .

# Installer les dépendances PHP
RUN composer install --no-dev --optimize-autoloader

# Copier les assets Vite compilés
COPY --from=vite-builder /app/public/build ./public/build

# Donner les bonnes permissions (optionnel)
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 /var/www/storage /var/www/bootstrap/cache

# Variables d'environnement
ENV APP_ENV=production
ENV APP_DEBUG=false

EXPOSE 8000

# Commande de démarrage
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
