<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Modifier le projet') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-4xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-xl sm:rounded-lg p-6">
                <a href="{{ route('admin.index') }}" class="text-blue-600 hover:underline mb-6 inline-block">← Retour à l'accueil admin</a>

                <form action="{{ route('admin.projets.update', $project->id) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PATCH')

                    {{-- TITRE --}}
                    <div class="mb-4">
                        <x-label for="titre" :value="'Titre'" />
                        <x-input id="titre" class="block mt-1 w-full" type="text" name="titre" value="{{ old('titre', $project->titre) }}" required />
                    </div>

                    {{-- DESCRIPTION --}}
                    <div class="mb-4">
                        <x-label for="description" :value="'Description'" />
                        <textarea id="description" name="description" rows="4" class="block mt-1 w-full rounded-md shadow-sm border-gray-300 dark:bg-gray-700 dark:border-gray-600 dark:text-white">{{ old('description', $project->description) }}</textarea>
                    </div>

                    {{-- TECHNOLOGIES --}}
                    <div class="mb-4">
                        <x-label for="technologies" :value="'Technologies'" />
                        <x-input id="technologies" class="block mt-1 w-full" type="text" name="technologies" value="{{ old('technologies', $project->technologies) }}" />
                    </div>

                    {{-- LIEN (URL OU PDF) --}}
                    <div class="mb-4">
                        <x-label for="url" :value="'Lien externe (URL ou PDF)'" />
                        <x-input id="url" class="block mt-1 w-full" type="text" name="url" value="{{ old('url', $project->url) }}" />
                        <small class="text-gray-500 dark:text-gray-300">Collez un lien ici ou ajoutez un PDF ci-dessous</small>
                    </div>

                    {{-- UPLOAD PDF --}}
                    <div class="mb-4">
                        <x-label for="pdf" :value="'Fichier PDF (optionnel)'" />
                        <input type="file" name="pdf" id="pdf" accept="application/pdf" class="block mt-1 w-full text-sm text-gray-700 dark:text-white" />
                    </div>

                    {{-- IMAGE --}}
                    <div class="mb-6">
                        <x-label for="image" :value="'Image du projet'" />
                        <input type="file" name="image" id="image" accept="image/*" class="block mt-1 w-full text-sm text-gray-700 dark:text-white" />
                        
                        @if($project->image)
                            <img src="{{ asset('storage/' . $project->image) }}" alt="Image actuelle" class="mt-3 rounded shadow w-32">
                        @endif
                    </div>

                    {{-- SUBMIT --}}
                    <div class="flex justify-end">
                        <x-button class="bg-blue-600 hover:bg-blue-700">
                            {{ __('Mettre à jour le projet') }}
                        </x-button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>
