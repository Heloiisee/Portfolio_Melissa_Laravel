<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Certification;
use Illuminate\Http\Request;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;

class CertificationController extends Controller
{
    public function index()
    {
        $certifications = Certification::all();
        return view('certifications.index', compact('certifications'));
    }

    public function indexAdmin()
    {
        $certifications = Certification::all();
        return view('admin.certifications.index', compact('certifications'));
    }

    public function create()
    {
        return view('admin.certifications.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nom' => 'required|string|max:255',
            'icon' => 'nullable|string|max:255',
            'pdf' => 'nullable|file|mimes:pdf|max:5000',
        ]);

        $uploadedPdf = null;

        if ($request->hasFile('pdf')) {
            $uploadedPdf = Cloudinary::uploadFile(
                $request->file('pdf')->getRealPath(),
                ['folder' => 'certifications', 'resource_type' => 'raw']
            )->getSecurePath();
        }

        Certification::create([
            'nom' => $request->nom,
            'icon' => $request->icon,
            'pdf' => $uploadedPdf,
        ]);

        return redirect()->route('admin.certifications.index')->with('success', 'Certification ajoutée avec succès !');
    }

    public function show(string $id)
    {
        $certification = Certification::findOrFail($id);
        return view('admin.certifications.show', compact('certification'));
    }

    public function edit(string $id)
    {
        $certification = Certification::findOrFail($id);
        return view('admin.certifications.edit', compact('certification'));
    }

    public function update(Request $request, string $id)
    {
        $request->validate([
            'nom' => 'required|string|max:255',
            'icon' => 'nullable|string|max:255',
            'pdf' => 'nullable|file|mimes:pdf|max:5000',
        ]);

        $certification = Certification::findOrFail($id);

        if ($request->hasFile('pdf')) {
            $uploadResult = Cloudinary::upload(
                $request->file('pdf')->getRealPath(),
                ['folder' => 'certifications', 'resource_type' => 'raw']
            );
        
            $newPdf = $uploadResult['secure_url'] ?? null;
        
            $certification->pdf = $newPdf;
        }
        

        $certification->nom = $request->nom;
        $certification->icon = $request->icon;
        $certification->save();

        return redirect()->route('admin.certifications.index')->with('success', 'Certification mise à jour avec succès.');
    }

    public function destroy(string $id)
    {
        $certification = Certification::findOrFail($id);

        // Optionnel : ici tu pourrais supprimer le fichier de Cloudinary
        // MAIS Cloudinary ne gère pas ça facilement sans avoir stocké le public_id

        $certification->delete();

        return redirect()->route('admin.certifications.index')->with('success', 'Certification supprimée avec succès.');
    }
}
