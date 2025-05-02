# 🎨 Portfolio - Melissa Guicheron

Bienvenue dans le dépôt de mon **portfolio personnel**, développé avec **Laravel**.  
Il présente mes projets, mes compétences et mes veilles technologiques, avec un design responsive et une page de contact éco-conçue.

---

## 🚀 Fonctionnalités

- ✅ Affichage de projets et de veilles (système de cartes responsive)
- ✅ Interface d’administration (CRUD complet des veilles)
- ✅ Formulaire de contact avec **envoi d’e-mail sans base de données**
- ✅ Design moderne avec Bootstrap 5
- ✅ Intégration d’images via Laravel Storage
- ✅ Utilisation de PostgreSQL
- ✅ Interface simple, légère et éco-conçue 🌱

---

## 🛠️ Technologies utilisées

- [Laravel 10](https://laravel.com/)
- [PostgreSQL](https://www.postgresql.org/)
- [Bootstrap 5.3](https://getbootstrap.com/)
- [SASS](https://sass-lang.com/)
- [Vite](https://vitejs.dev/)
- [FontAwesome](https://fontawesome.com/)

---

## ⚙️ Installation locale

### Prérequis

- PHP ≥ 8.1
- Composer
- Node.js & npm
- PostgreSQL
- Un outil comme Laravel Sail, Valet ou XAMPP (facultatif)

### Étapes

```bash
git clone https://github.com/Heloiisee/Portfolio_Melissa_Laravel.git
cd portfolio-laravel

composer install
npm install && npm run dev

cp .env.example .env
php artisan key:generate

php artisan migrate
php artisan serve
