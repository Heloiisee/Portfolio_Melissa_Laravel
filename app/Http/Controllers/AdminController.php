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

    // 📁 Enregistrement de l'image dans public/images/
    if ($request->hasFile('image')) {
        $image = $request->file('image');
        $filename = time() . '_' . $image->getClientOriginalName();
        $image->move(public_path('images'), $filename);
        $project->image = 'images/' . $filename;
    }

    // 📄 PDF ou URL
    if ($request->hasFile('pdf')) {
        $pdfPath = $request->file('pdf')->storeAs('pdfs', time() . '_' . $request->file('pdf')->getClientOriginalName(), 'public');
        $project->url = 'storage/' . $pdfPath;
    } else {
        $project->url = $request->url;
    }

    $project->save();

    return redirect()->route('admin.index')->with('success', 'Projet ajouté avec succès.');
}




public function destroy(Project $project)
{
    // 🗑️ Suppression de l'image physique si elle existe
    if ($project->image && file_exists(public_path($project->image))) {
        unlink(public_path($project->image));
    }

    // 🗑️ (Optionnel) Suppression du fichier PDF aussi
    if ($project->url && str_starts_with($project->url, 'storage/pdfs/') && file_exists(public_path($project->url))) {
        unlink(public_path($project->url));
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

    // 📁 Mise à jour de l'image
    if ($request->hasFile('image')) {
        $image = $request->file('image');
        $filename = time() . '_' . $image->getClientOriginalName();
        $image->move(public_path('images'), $filename);
        $project->image = 'images/' . $filename;
    }

    // 📄 Mise à jour du PDF ou de l'URL
    if ($request->hasFile('pdf')) {
        $pdfPath = $request->file('pdf')->storeAs('pdfs', time() . '_' . $request->file('pdf')->getClientOriginalName(), 'public');
        $project->url = 'storage/' . $pdfPath;
    } elseif ($request->url) {
        $project->url = $request->url;
    }

    $project->save();

    return redirect()->route('admin.index')->with('success', 'Projet mis à jour.');
}




}
