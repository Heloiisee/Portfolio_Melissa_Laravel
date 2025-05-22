<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

use App\Models\Project;

class AdminController extends Controller
{
    public function index()
    {
        $projects = Project::all(); // ou Project::latest()->get() si tu veux les plus récents d'abord

        return view('admin.index', compact('projects'));
    }
    public function showProjects()
{
    // Logique pour afficher tous les projets
    $projects = Project::all();
    return view('admin.projects.index', compact('projects'));

}



public function create()
{
    // Logique pour afficher le formulaire de création d'un projet
    return view('admin.projets.create');
}
public function store(Request $request)
{
    $request->validate([
        'titre' => 'required|string|max:255',
        'description' => 'nullable|string',
        'technologies' => 'nullable|string',
        'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        'pdf' => 'nullable|mimes:pdf|max:5000',
        'url' => 'nullable|url',
    ]);

    $project = new Project();
    $project->titre = $request->titre;
    $project->description = $request->description;
    $project->technologies = $request->technologies;

    if ($request->hasFile('image')) {
    
        $project->image = $request->file('image')->store('images', 'public');
    }

    if ($request->hasFile('pdf')) {
        $project->url = 'storage/' . $request->file('pdf')->store('pdfs', 'public');
    } else {
        $project->url = $request->url; // Si l'utilisateur met un lien
    }

    $project->save();

    return redirect()->route('admin.index')->with('success', 'Projet ajouté avec succès.');
}




public function destroy(Project $project)
{
if ($project->image) {
    Storage::delete('public/' . $project->image);
}

$project->delete();

return redirect()->route('admin.index')->with('success', 'Projet supprimé.');
}

public function show(Project $project)
{
    return view('admin.projets.show', compact('project'));

}
public function edit(Project $project)
{
    return view('admin.projets.edit', compact('project'));
}

public function update(Request $request, Project $project)
{
    $request->validate([
        'titre' => 'required|string|max:255',
        'description' => 'nullable|string',
        'technologies' => 'nullable|string',
        'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        'pdf' => 'nullable|mimes:pdf|max:5000',
        'url' => 'nullable|url',
    ]);

    $project->titre = $request->titre;
    $project->description = $request->description;
    $project->technologies = $request->technologies;

    // ✅ Remplacement d’image (et suppression de l’ancienne si existante)
    if ($request->hasFile('image')) {
        if ($project->image && Storage::disk('public')->exists($project->image)) {
            Storage::disk('public')->delete($project->image);
        }

        $project->image = $request->file('image')->store('images', 'public');
    }

    // ✅ Remplacement de PDF (ou URL)
    if ($request->hasFile('pdf')) {
        // Supprimer l'ancien PDF s’il existe
        if ($project->url && str_starts_with($project->url, 'storage/pdfs/')) {
            $pdfPath = str_replace('storage/', '', $project->url);
            Storage::disk('public')->delete($pdfPath);
        }

        $project->url = 'storage/' . $request->file('pdf')->store('pdfs', 'public');
    } elseif ($request->url) {
        $project->url = $request->url;
    }

    $project->save();

    return redirect()->route('admin.index')->with('success', 'Projet mis à jour.');
}




}
