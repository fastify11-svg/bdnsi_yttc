<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class FooterLinkController extends Controller
{
    public function index()
    {
        $links = \App\Models\FooterLink::orderBy('sort_order', 'asc')->get();
        return \Inertia\Inertia::render('Admin/Footer/Links', [
            'links' => $links
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'label' => 'required|string|max:255',
            'url' => 'nullable|string|max:255',
            'sort_order' => 'nullable|integer',
            'is_active' => 'nullable|boolean',
        ]);

        \App\Models\FooterLink::create([
            'label' => $request->label,
            'url' => $request->url ?? '#',
            'sort_order' => $request->sort_order ?? 0,
            'is_active' => $request->has('is_active') ? $request->is_active : 1,
        ]);

        return redirect()->back()->with('success', 'Footer link added successfully.');
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'label' => 'required|string|max:255',
            'url' => 'nullable|string|max:255',
            'sort_order' => 'nullable|integer',
            'is_active' => 'nullable|boolean',
        ]);

        $link = \App\Models\FooterLink::findOrFail($id);
        $link->update([
            'label' => $request->label,
            'url' => $request->url ?? '#',
            'sort_order' => $request->sort_order ?? 0,
            'is_active' => $request->has('is_active') ? $request->is_active : 1,
        ]);

        return redirect()->back()->with('success', 'Footer link updated successfully.');
    }

    public function destroy($id)
    {
        $link = \App\Models\FooterLink::findOrFail($id);
        $link->delete();

        return redirect()->back()->with('success', 'Footer link deleted successfully.');
    }
}
