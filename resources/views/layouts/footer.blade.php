<footer>
    <div class="container reveal">
        <div class="row">
            <div class="col-md-6 reveal-1">
                <h3><strong>Réseaux sociaux</strong></h3>
                <ul class="list-unstyled">
                    <li><a href="https://www.linkedin.com/in/melissa-guicheron-6a6201290/" target="_blank">LinkedIn</a></li>
                </ul>
            </div>
            <div class="col-md-6 reveal-2">
                <h3><strong>Navigation</strong></h3>
                <ul class="list-unstyled">
                    <li><a href="{{ route('home') }}">Accueil</a></li>
                    <li><a href="{{ route('projects.index') }}">Projets</a></li>
                    <li><a href="{{ route('veilles.index') }}">Veilles</a></li>
                    <li><a href="{{ route('propos.index') }}">Propos</a></li>
                    <li><a href="{{ route('mentions-legale') }}">Mentions légales</a></li> {{-- ✅ Ajout du lien --}}
                    <li><a href="{{ route('confidentialite') }}">Politique de confidentialité</a></li> {{-- ✅ Ajout du lien --}}
                </ul>
            </div>
        </div>
    </div>
    <div class="text-center py-3">
        <p class="text-muted">&copy; {{ now()->year }} Melissa Guicheron. Tous droits réservés.</p>
</footer>
