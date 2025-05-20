<footer class=" mt-5 pt-4 pb-3">
    <div class="container reveal">
        <div class="row">
            <div class="col-md-6 mb-4 mb-md-0 reveal-1">
                <h5 class="fw-bold text-light">Réseaux sociaux</h5>
                <ul class="list-unstyled">
                    <li>
                        <a href="https://www.linkedin.com/in/melissa-guicheron-6a6201290/" 
                           target="_blank" rel="noopener noreferrer"
                           class="text-light text-decoration-none" 
                           aria-label="LinkedIn - nouvelle fenêtre">
                            <i class="fab fa-linkedin me-2"></i>LinkedIn
                        </a>
                    </li>
                </ul>
            </div>

            <div class="col-md-6 reveal-2">
                <h5 class="fw-bold text-light">Navigation</h5>
                <ul class="list-unstyled">
                    <li><a href="{{ url('/') }}" class="text-light text-decoration-none">Accueil</a></li>
                    <li><a href="{{ route('projects.index') }}" class="text-light text-decoration-none">Projets</a></li>
                    <li><a href="{{ route('veilles.index') }}" class="text-light text-decoration-none">Veilles</a></li>
                    <li><a href="{{ route('propos.index') }}" class="text-light text-decoration-none">Propos</a></li>
                    <li><a href="{{ route('mentions-legale') }}" class="text-light text-decoration-none">Mentions légales</a></li>
                    <li><a href="{{ route('confidentialite') }}" class="text-light text-decoration-none">Politique de confidentialité</a></li>
                </ul>
            </div>
        </div>

        <div class="text-center mt-4 pt-3 border-top border-light-subtle">
            <small class="text-light">
                &copy; {{ now()->year }} Melissa Guicheron. Tous droits réservés.
            </small>
        </div>
    </div>

    
</footer>
