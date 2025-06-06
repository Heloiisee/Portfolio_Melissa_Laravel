<x-app-layout>
    <x-slot name="header">
        <h2 class="text-xl font-semibold text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Modifier la certification') }}
        </h2>
    </x-slot>

    <div class="py-6">
        <div class="max-w-xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white dark:bg-gray-800 p-6 shadow sm:rounded-lg">
                <form method="POST" action="{{ route('admin.certifications.update', $certification->id) }}" enctype="multipart/form-data">
                    @csrf
                    @method('PATCH')

                    {{-- Nom --}}
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300">Nom</label>
                        <input type="text" name="nom" value="{{ old('nom', $certification->nom) }}" required class="w-full mt-1 p-2 border rounded">
                        @error('nom') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
                    </div>

                    {{-- Icône --}}
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300">Icône (classe FontAwesome)</label>
                        <input type="text" name="icon" value="{{ old('icon', $certification->icon) }}" required class="w-full mt-1 p-2 border rounded">
                        @error('icon') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
                    </div>

                    {{-- PDF --}}
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 dark:text-gray-300">PDF (optionnel)</label>
                        <input type="file" name="pdf" accept="application/pdf" class="w-full mt-1 p-2 border rounded">
                        @if($certification->pdf)
                            <p class="text-sm text-gray-400 mt-1">PDF actuel : 
                                <a href="{{ asset($certification->pdf) }}" target="_blank" class="text-blue-400 underline">Voir le fichier</a>
                            </p>
                        @endif
                        @error('pdf') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
                    </div>

                    {{-- Bouton --}}
                    <div>
                        <button type="submit" class="bg-green-600 text-white px-4 py-2 rounded hover:bg-green-700">
                            Mettre à jour
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</x-app-layout>
