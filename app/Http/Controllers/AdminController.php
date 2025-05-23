<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use CloudinaryLabs\CloudinaryLaravel\Facades\Cloudinary;



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

    // Upload image vers Cloudinary
    if ($request->hasFile('image')) {
        $uploadedImage = Cloudinary::upload(
            $request->file('image')->getRealPath(),
            ['folder' => 'portfolio_projects']
        );
        $project->image = $uploadedImage['secure_url'];
        $project->image_public_id = $uploadedImage['public_id'];
    }

    // Upload PDF vers Cloudinary
    if ($request->hasFile('pdf')) {
        $uploadedPdf = Cloudinary::upload(
            $request->file('pdf')->getRealPath(),
            ['folder' => 'portfolio_pdfs', 'resource_type' => 'raw']
        );
        $project->url = $uploadedPdf['secure_url'];
        $project->pdf_public_id = $uploadedPdf['public_id'];
    } else {
        $project->url = $request->url;
    }

    $project->save();

    return redirect()->route('admin.index')->with('success', 'Projet ajouté avec succès.');
}




public function destroy(Project $project)
{
    // Supprimer image sur Cloudinary
    if ($project->image_public_id) {
        Cloudinary::destroy($project->image_public_id);
    }

    // Supprimer PDF sur Cloudinary
    if ($project->pdf_public_id) {
        Cloudinary::destroy($project->pdf_public_id, ['resource_type' => 'raw']);
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

    // Remplacer image si nouvelle
    if ($request->hasFile('image')) {
        if ($project->image_public_id) {
            Cloudinary::destroy($project->image_public_id);
        }

        $uploadedImage = Cloudinary::upload(
            $request->file('image')->getRealPath(),
            ['folder' => 'portfolio_projects']
        );
        dd($uploadedImage);
        $project->image = $uploadedImage['secure_url'];
        $project->image_public_id = $uploadedImage['public_id'];
    }

    // Remplacer PDF si nouveau
    if ($request->hasFile('pdf')) {
        if ($project->pdf_public_id) {
            Cloudinary::destroy($project->pdf_public_id, ['resource_type' => 'raw']);
        }

        $uploadedPdf = Cloudinary::upload(
            $request->file('pdf')->getRealPath(),
            ['folder' => 'portfolio_pdfs', 'resource_type' => 'raw']
        );
        $project->url = $uploadedPdf['secure_url'];
        $project->pdf_public_id = $uploadedPdf['public_id'];
    } elseif ($request->url) {
        $project->url = $request->url;
    }

    $project->save();

    return redirect()->route('admin.index')->with('success', 'Projet mis à jour.');
}







}
