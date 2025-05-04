# ===============================
# Étape 1 : Builder les assets avec Vite
# ===============================
FROM node:18-alpine AS vite-builder

WORKDIR /app

COPY package*.json vite.config.* ./
RUN npm install

COPY resources ./resources
COPY public ./public
RUN npm run build

# ===============================
# Étape 2 : Image PHP/Laravel
# ===============================
FROM php:8.2-fpm-alpine

# Dépendances nécessaires
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
    bash \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_pgsql zip intl opcache gd

# Installer Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

# Copier les fichiers
COPY . .

# Installer les dépendances PHP sans scripts
RUN composer install --no-dev --optimize-autoloader --no-scripts

# Copier les assets Vite
COPY --from=vite-builder /app/public/build ./public/build

# Permissions recommandées
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 storage bootstrap/cache

# Exposer le port (utilisé par Laravel)
EXPOSE 8000

# Lancer Laravel
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
