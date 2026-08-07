<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\DocumentTemplate;
use Illuminate\Http\Request;

class DocumentTemplateController extends Controller
{
    public function index()
    {
        $templates = DocumentTemplate::latest()->get();
        return inertia('Admin/DocumentTemplate/Index', compact('templates'));
    }

    public function create()
    {
        return inertia('Admin/DocumentTemplate/Create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'type' => 'required|string|max:50',
            'width' => 'required|string|max:50',
            'height' => 'required|string|max:50',
            'background_image' => 'nullable|image|max:2048',
        ]);

        if ($request->hasFile('background_image')) {
            $validated['background_image'] = $request->file('background_image')->store('document_templates', 'public');
        }

        DocumentTemplate::create($validated);

        return redirect()->route('admin.document-templates.index')->with('success', 'Template created successfully.');
    }

    public function edit(DocumentTemplate $documentTemplate)
    {
        $documentTemplate->load('fields');
        return inertia('Admin/DocumentTemplate/Edit', [
            'template' => $documentTemplate
        ]);
    }

    public function update(Request $request, DocumentTemplate $documentTemplate)
    {
        // This will be implemented in Phase 2 for the Drag & Drop editor
    }

    public function preview($id)
    {
        $template = DocumentTemplate::with('fields')->findOrFail($id);
        
        // This view will just output plain HTML with absolute positioned fields
        return view('admin.document_template.preview', compact('template'));
    }
}
