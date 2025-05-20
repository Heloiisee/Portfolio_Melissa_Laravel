# ============================================
# Étape 1 : Build des assets Vite (JS, SASS, Tailwind)
# ============================================
FROM node:18-alpine AS vite-builder

WORKDIR /app

# Copie des fichiers nécessaires au build front
COPY package*.json vite.config.* tailwind.config.js postcss.config.js ./
RUN npm install

COPY resources ./resources
COPY public ./public

# Compilation des assets (JS, CSS, Tailwind, SASS, etc.)
RUN npm run build


# ============================================
# Étape 2 : PHP / Laravel backend
# ============================================
FROM php:8.2-fpm-alpine

# Étape 2.1 : installation des dépendances système
RUN apk add --no-cache \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    oniguruma-dev \
    icu-dev \
    zlib-dev \
    libxml2-dev \
    libzip-dev \
    postgresql-dev \
    curl \
    git \
    unzip \
    bash

# Étape 2.2 : extensions PHP GD & autres
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install \
    pdo \
    pdo_pgsql \
    zip \
    intl \
    opcache \
    gd

# Étape 2.3 : Installer Composer (copie directe depuis l'image composer officielle)
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Étape 2.4 : Définir le répertoire de travail Laravel
WORKDIR /var/www

# Étape 2.5 : Copier les fichiers de l’application Laravel
COPY . .

# Étape 2.6 : Installer les dépendances PHP de prod
RUN composer install --no-dev --optimize-autoloader --no-scripts

# Étape 2.7 : Copier les assets Vite compilés dans public/build
COPY --from=vite-builder /app/public/build ./public/build

# Étape 2.8 : Permissions
RUN chown -R www-data:www-data /var/www \
 && chmod -R 755 storage bootstrap/cache

# Exposer le port utilisé par Laravel
EXPOSE 8080

# Démarrer le serveur Laravel
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8080"]
