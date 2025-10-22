<?php

use App\Http\Controllers\HomeController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Session;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



Route::get('result', \App\Http\Controllers\ResultController::class)->name('result');


Route::get('/', [HomeController::class,'index'])->name('welcome');
Route::get('/license-view/{number?}', [HomeController::class,'license'])->name('license.view');
Route::get('/all-course', [HomeController::class,'all_course'])->name('all_course');
Route::get('/course-details/{id}', [HomeController::class,'courseDetails'])->name('course.details');
Route::get('/institute-details/{id}', [HomeController::class,'instituteDetails'])->name('institute.details');
Route::get('/page', [HomeController::class,'dymamicPage'])->name('dynamicPage');
Route::get('/all-notice-list', [HomeController::class,'frontendNoticeList'])->name('frontendNoticeList');
Route::get('/all-notice-list/{id}', [HomeController::class,'noticeDetails'])->name('noticeDetails');



Route::match(['get','post'],'/contact-us', [HomeController::class,'contactUs'])->name('contactUs');

Route::resource('center-request', \App\Http\Controllers\CenterRequestController::class)->only(['create','store']);


Route::resource('student', \App\Http\Controllers\StudentController::class);
Route::resource('student-submission', \App\Http\Controllers\StudentSubmissionController::class)->only(['create','store']);

Route::get('/dashboard', \App\Http\Controllers\DashboardController::class)->middleware(['auth'])->name('dashboard');

Route::get('center-student-result', \App\Http\Controllers\CenterTotalResultController::class)->name('centerStudentResult');

Route::get('verified-institute', [\App\Http\Controllers\FrontendController::class,'verifyInstitute'])->name('verifiedInstitute');
Route::get('success-student', [\App\Http\Controllers\FrontendController::class,'successStudent'])->name('successStudent');
Route::get('success-student-details/{id}', [\App\Http\Controllers\FrontendController::class,'successStudentDetails'])->name('successStudentDetails');
Route::get('student-info/{id}', [\App\Http\Controllers\FrontendController::class,'studentInfo'])->name('studentInfo');

Route::resource('password-update', \App\Http\Controllers\PasswordUpdateController::class)
    ->only(['create','store']);
Route::resource('profile-update', \App\Http\Controllers\ProfileUpdateController::class)
    ->only(['create','store']);


Route::middleware('auth')->group(function(){
    Route::resource('password-update', \App\Http\Controllers\PasswordUpdateController::class)
        ->only(['create','store']);
    Route::resource('profile-update', \App\Http\Controllers\ProfileUpdateController::class)
        ->only(['create','store']);
});

Route::get('portal/{user}', \App\Http\Controllers\PortalController::class)->name('portal');


Route::get('student-phone-update-link',function (){
/*    $duplicates = DB::table('students')
        ->select('phone', DB::raw('COUNT(phone) as count'))
        ->groupBy('phone')
        ->having('count', '>', 1)
        ->get();

    foreach ($duplicates as $duplicate) {
        $phone = $duplicate->phone;
        $studentsToUpdate = Student::where('phone', $phone)->get();
        foreach ($studentsToUpdate as $index => $student) {
            $newPhone = $phone.($index + 1);
            $student->phone = $newPhone;
            $student->save();
        }
    }*/
});

Route::get('whatapp-link/{phone}', function ($phone) {
    $data=\App\Models\WhatappLink::where('phone',$phone)->first();
    return view('frontend.page.whatapplink',[
        'data'=>$data
    ]);
})->name('whatapp.link');


Route::get('/lang-change', function (Request $request) {
    $locale = $request->input('locale');
    if (in_array($locale, ['en', 'bn', 'ar'])) {
        Session::put('locale', $locale);
        App::setLocale($locale);
    }

    return redirect()->back();
});


require __DIR__.'/auth.php';
require __DIR__.'/admin.php';
//require __DIR__.'/student.php'; student panel



