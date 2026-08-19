<?php

namespace App\Http\Controllers;

use App\Enums\StudentStatus;
use App\Models\Student;
use Illuminate\Http\Request;
use Inertia\Inertia;

class VerifyController extends Controller
{
    public function index()
    {
        return Inertia::render('Verify');
    }

    public function check(Request $request)
    {
        $request->validate([
            'registration' => 'required|string',
        ]);

        $student = Student::with(['center', 'subject', 'result'])
            ->where('registration', $request->registration)
            ->where('status', StudentStatus::Approved)
            ->first();

        if (!$student) {
            return redirect()->back()->withErrors(['error' => 'No valid registration or diploma found for this ID.']);
        }

        return Inertia::render('Verify', ['student' => $student]);
    }
}
