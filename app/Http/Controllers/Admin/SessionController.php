<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Session;
use App\Models\Student;
use App\Traits\ChecksPermission;
use Illuminate\Http\Request;

class SessionController extends Controller
{
    use ChecksPermission;
    protected $permissionPrefix = 'session';
    public function index(Request $request)
    {
        if ($request->ajax()) {
            return datatables(Session::query())->toJson();
        }

        return view('admin.session.index');
    }

    public function create()
    {
        return view('admin.session.create');
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'name' => 'required|string',
            'exam_date' => 'nullable|date',
            'result_published_date' => 'nullable|date',
            'duration' => 'required|numeric',
        ]);

        return response()->report(Session::create($validated), 'Session Created successfully');
    }

    public function edit(Session $session)
    {
        return view('admin.session.edit', compact('session'));
    }

    public function update(Request $request, Session $session)
    {
        $validated = $request->validate([
            'name' => 'required|string',
            'exam_date' => 'nullable|date',
            'result_published_date' => 'nullable|date',
            'duration' => 'required|numeric',
            'status' => 'required',
        ]);

        $session->update($validated);

        // Sync associated students
        Student::where('session_id', $session->id)->update([
            'course_type' => $session->course_type, // This resolves to the integer value
            'course_duration' => $session->course_duration_string,
            'exam_date' => $session->exam_date,
            'result_publised' => $session->result_published_date,
        ]);

        return response()->report(true, 'Session Updated successfully');
    }

    public function destroy(Session $session)
    {
        return response()->report($session->delete(), 'Session deleted successfully');
    }
}
