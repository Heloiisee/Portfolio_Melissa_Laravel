# ===============================
# Étape 1 : Build des assets avec Vite
# ===============================
FROM node:18-alpine AS vite-builder

WORKDIR /app

COPY package*.json vite.config.* ./
RUN npm install

COPY resources ./resources
COPY public ./public

RUN npm run build


# ===============================
# Étape 2 : Base Laravel + PHP
# ===============================
FROM php:8.2-fpm-alpine

# Installer les dépendances nécessaires
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
    unzip \
    git \
    curl \
    bash \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_pgsql zip intl opcache gd

# Installer Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Dossier de travail
WORKDIR /var/www

# Copier les fichiers Laravel
COPY . .

# Copier les assets compilés avec Vite
COPY --from=vite-builder /app/public/build ./public/build

# Installer les dépendances PHP de Laravel
RUN composer install --no-dev --optimize-autoloader

# Configuration Laravel
RUN cp .env.example .env \
    && php artisan key:generate \
    && php artisan config:cache \
    && php artisan route:cache \
    && php artisan view:cache

# Droits pour les dossiers nécessaires
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 storage bootstrap/cache

# Port exposé
EXPOSE 8000

# Commande de démarrage
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
