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
        $fields = $request->input('fields', []);

        // Delete all old fields and recreate them (simpler than syncing manually)
        $documentTemplate->fields()->delete();

        foreach ($fields as $fieldData) {
            $documentTemplate->fields()->create([
                'variable_key' => $fieldData['variable_key'],
                'position_x' => $fieldData['position_x'],
                'position_y' => $fieldData['position_y'],
                'font_size' => $fieldData['font_size'] ?? null,
                'font_family' => $fieldData['font_family'] ?? null,
                'font_weight' => $fieldData['font_weight'] ?? null,
                'color' => $fieldData['color'] ?? null,
                'text_align' => $fieldData['text_align'] ?? null,
                'width' => $fieldData['width'] ?? null,
                'height' => $fieldData['height'] ?? null,
                'z_index' => $fieldData['z_index'] ?? 1,
                'letter_spacing' => $fieldData['letter_spacing'] ?? null,
                'text_transform' => $fieldData['text_transform'] ?? null,
                'text_shadow' => $fieldData['text_shadow'] ?? null,
            ]);
        }

        return redirect()->back()->with('success', 'Layout saved successfully.');
    }

    public function preview($id)
    {
        $template = DocumentTemplate::with('fields')->findOrFail($id);
        
        // This view will just output plain HTML with absolute positioned fields
        return view('admin.document_template.preview', compact('template'));
    }
}
