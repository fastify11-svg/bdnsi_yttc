<?php

namespace App\Http\Controllers\Admin;

use App\Enums\StudentStatus;
use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\ContactUs;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;

class DashboardController extends Controller
{
    public function __construct()
    {
        /*
         * Uncomment the line below if you want to use verified middleware
         */
        //$this->middleware('verified:admin.verification.notice');
    }


    public function index(){
        $cards = collect([
            'Total Student ' => [
                'value' => Student::count(),
                'url' => route('admin.student.index'),
            ],
            'Total Approved Student ' => [
                'value' => Student::where('status',StudentStatus::Approved)->count(),
                'url' => route('admin.student.index'),
            ],
            'Total Pending Student ' => [
                'value' => Student::where('status',StudentStatus::Pending)->count(),
                'url' => route('admin.student.index'),
            ],
        ]);
        $adminList = Admin::all();

        return \Inertia\Inertia::render('Admin/Dashboard', [
            'cards' => $cards,
            'adminList' => $adminList,
        ]);
    }

    public function userCreate(Request $request){

     $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:admins'],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);

       $user= Admin::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);
        return response()->success('Successfully Created');

    }


}
