<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Notice;
use App\Traits\ChecksPermission;
use Illuminate\Http\Request;

class NoticeController extends Controller
{
    use ChecksPermission;
    protected $permissionPrefix = 'notice';

    public function index(Request $request)
    {
        if ($request->ajax() && !$request->header('X-Inertia')) {
            return datatables(Notice::query())->addIndexColumn()->toJson();
        }

        $query = Notice::latest();

        if ($request->filled('search')) {
            $search = $request->input('search');
            $query->where(function($q) use ($search) {
                $q->where('details', 'like', "%{$search}%")
                  ->orWhere('bn_details', 'like', "%{$search}%")
                  ->orWhere('ar_details', 'like', "%{$search}%");
            });
        }

        $notices = $query->paginate(20)->withQueryString();

        // Map formatted date
        $notices->getCollection()->transform(function($notice) {
            $notice->formatted_date = $notice->created_at ? $notice->created_at->format('d M Y') : 'N/A';
            return $notice;
        });

        $filters = [
            'search' => $request->input('search', ''),
        ];

        return \Inertia\Inertia::render('Admin/Notice/Index', [
            'notices' => $notices,
            'filters' => $filters,
        ]);
    }

    public function create()
    {
        return \Inertia\Inertia::render('Admin/Notice/Create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'nullable|string',
            'details' => 'nullable|string',
            'bn_details' => 'nullable|string',
            'ar_details' => 'nullable|string',
            'image' => 'nullable',
        ]);

        $details = $validated['details'] ?? $validated['title'] ?? 'General Notice';

        Notice::create([
            'details' => $details,
            'bn_details' => $validated['bn_details'] ?? $details,
            'ar_details' => $validated['ar_details'] ?? $details,
            'image' => $validated['image'] ?? null,
        ]);

        return redirect()->route('notice.index')->with('success', 'Notice published successfully!');
    }

    public function edit(Notice $notice)
    {
        return \Inertia\Inertia::render('Admin/Notice/Edit', [
            'notice' => $notice
        ]);
    }

    public function update(Request $request, Notice $notice)
    {
        $validated = $request->validate([
            'title' => 'nullable|string',
            'details' => 'nullable|string',
            'bn_details' => 'nullable|string',
            'ar_details' => 'nullable|string',
            'image' => 'nullable',
        ]);

        $details = $validated['details'] ?? $validated['title'] ?? $notice->details;

        $notice->update([
            'details' => $details,
            'bn_details' => $validated['bn_details'] ?? $details,
            'ar_details' => $validated['ar_details'] ?? $details,
            'image' => $validated['image'] ?? $notice->image,
        ]);

        return redirect()->route('notice.index')->with('success', 'Notice updated successfully!');
    }

    public function destroy(Notice $notice)
    {
        $notice->delete();
        return redirect()->back()->with('success', 'Notice deleted successfully!');
    }
}
