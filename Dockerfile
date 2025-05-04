# ===============================
# Étape 1 : Build des assets avec Vite
# ===============================
FROM node:18-alpine AS vite-builder

WORKDIR /app

# Copier les fichiers nécessaires pour npm
COPY package*.json vite.config.* ./
RUN npm install

# Copier les sources pour build Vite
COPY resources ./resources
COPY public ./public

# Compiler les assets avec Vite
RUN npm run build

# ===============================
# Étape 2 : Laravel avec PHP
# ===============================
FROM php:8.2-fpm-alpine

# Installer dépendances système
RUN apk add --no-cache \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    oniguruma-dev \
    icu-dev \
    zlib-dev \
    libxml2-dev \
    postgresql-dev \
    && docker-php-ext-install pdo pdo_pgsql zip intl opcache \
    && docker-php-ext-configure gd \
        --with-freetype \
        --with-jpeg \
    && docker-php-ext-install gd


# Installer Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Définir le répertoire de travail
WORKDIR /var/www

# Copier les fichiers du projet
COPY . .

# Copier les assets compilés avec Vite
COPY --from=vite-builder /app/public/build ./public/build

# Générer la clé d’application
RUN php artisan key:generate

# Installer les dépendances PHP sans les scripts pour éviter les erreurs
RUN composer install --no-dev --optimize-autoloader --no-scripts

# Cacher la config, routes et vues
RUN php artisan config:cache && \
    php artisan route:cache && \
    php artisan view:cache

# Donner les bonnes permissions
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 storage bootstrap/cache

# Exposer le port Laravel
EXPOSE 8000

# Démarrer Laravel
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=${PORT}"]

