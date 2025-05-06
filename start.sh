#!/bin/bash

# Donne les bons droits
chmod -R 775 storage bootstrap/cache

# Crée le lien symbolique pour accéder aux fichiers depuis /public/storage
php artisan storage:link

# Exécute les migrations (en forçant si la base existe déjà)
php artisan migrate --force

# Optionnel : compile la config en cache pour plus de performance
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Démarre le serveur Laravel (pour Railway)
exec php artisan serve --host=0.0.0.0 --port=8080
