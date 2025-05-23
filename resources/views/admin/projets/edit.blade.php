<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Modifier le projet') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-4xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-xl sm:rounded-lg p-6">
                <a href="{{ route('admin.index') }}" class="text-blue-600 hover:underline mb-6 inline-block">
                    ← Retour à l'accueil admin
                </a>

                <form action="{{ route('admin.projets.update', $project->id) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PATCH')

                    {{-- TITRE --}}
                    <div class="mb-4">
                        <label for="titre" class="block text-sm font-medium text-gray-700 dark:text-gray-200">Titre</label>
                        <input type="text" name="titre" id="titre"
                            value="{{ old('titre', $project->titre) }}"
                            required
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm dark:bg-gray-700 dark:border-gray-600 dark:text-white" />
                    </div>

                    {{-- DESCRIPTION --}}
                    <div class="mb-4">
                        <label for="description" class="block text-sm font-medium text-gray-700 dark:text-gray-200">Description</label>
                        <textarea name="description" id="description" rows="4"
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm dark:bg-gray-700 dark:border-gray-600 dark:text-white">{{ old('description', $project->description) }}</textarea>
                    </div>

                    {{-- TECHNOLOGIES --}}
                    <div class="mb-4">
                        <label for="technologies" class="block text-sm font-medium text-gray-700 dark:text-gray-200">Technologies</label>
                        <input type="text" name="technologies" id="technologies"
                            value="{{ old('technologies', $project->technologies) }}"
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm dark:bg-gray-700 dark:border-gray-600 dark:text-white" />
                    </div>

                    {{-- LIEN URL --}}
                    <div class="mb-4">
                        <label for="url" class="block text-sm font-medium text-gray-700 dark:text-gray-200">Lien externe (URL ou PDF)</label>
                        <input type="text" name="url" id="url"
                            value="{{ old('url', $project->url) }}"
                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm dark:bg-gray-700 dark:border-gray-600 dark:text-white" />
                        <small class="text-gray-500 dark:text-gray-300">Collez un lien ici ou ajoutez un PDF ci-dessous</small>
                    </div>

                    {{-- PDF --}}
                    <div class="mb-4">
                        <label for="pdf" class="block text-sm font-medium text-gray-700 dark:text-gray-200">Fichier PDF (optionnel)</label>
                        <input type="file" name="pdf" id="pdf"
                            accept="application/pdf"
                            class="mt-1 block w-full text-sm text-gray-700 dark:text-white" />
                    </div>

                    {{-- IMAGE --}}
                    <div class="mb-6">
                        <label for="image" class="block text-sm font-medium text-gray-700 dark:text-gray-200">Image du projet</label>
                        <input type="file" name="image" id="image"
                            accept="image/*"
                            class="mt-1 block w-full text-sm text-gray-700 dark:text-white" />
                        
                        @if($project->image)
                            <img src="{{ asset($project->image) }}" alt="{{ $project->titre }}" class="project-image">
                        @endif
                    </div>

                    {{-- SUBMIT --}}
                    <div class="flex justify-end">
                        <button type="submit"
                            class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded">
                            Mettre à jour le projet
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>
