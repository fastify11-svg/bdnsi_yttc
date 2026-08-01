<?php

namespace App\Http\Controllers;

use App\Enums\StudentStatus;
use App\Lib\Card;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{
    public function __invoke()
    {
        $auth = Auth::user();
        $centerId = $auth->center_id;

        $cards = [
            'Total Student' => Student::hide()->where('center_id', $centerId)->count(),
            'Total Approved' => Student::hide()->where('center_id', $centerId)->where('status', StudentStatus::Approved)->count(),
            'Total Pending' => Student::hide()->where('center_id', $centerId)->whereIn('status', [StudentStatus::Pending, StudentStatus::Requested])->count()
        ];

        return \Inertia\Inertia::render('Center/Dashboard', compact('cards'));
    }



}
