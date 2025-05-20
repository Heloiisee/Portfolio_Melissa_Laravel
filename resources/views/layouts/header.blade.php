<header id="header" class="py-3 shadow-sm bg-white sticky-top">
    <div class="container">
        <nav class="navbar navbar-expand-lg">
            <a class="navbar-brand fw-bold text-uppercase" href="{{ url('/') }}">Melissa.</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto d-flex align-items-center gap-lg-4 gap-2 text-center">
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('/') }}">Accueil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('projects.index') }}">Projets</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('veilles.index') }}">Veilles</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="{{ route('propos.index') }}">Propos</a>
                    </li>
                    <!-- <li class="nav-item">
                        <a class="nav-link" href="{{ route('contact') }}">Contact</a>
                    </li> -->
                </ul>
            </div>
        </nav>
    </div>
</header>
