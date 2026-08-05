<?php

use App\Http\Controllers\Admin\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Admin\Auth\ConfirmablePasswordController;
use App\Http\Controllers\Admin\Auth\EmailVerificationNotificationController;
use App\Http\Controllers\Admin\Auth\EmailVerificationPromptController;
use App\Http\Controllers\Admin\Auth\NewPasswordController;
use App\Http\Controllers\Admin\Auth\PasswordResetLinkController;
use App\Http\Controllers\Admin\Auth\RegisteredUserController;
use App\Http\Controllers\Admin\Auth\VerifyEmailController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\SliderController;
use Illuminate\Support\Facades\Route;

Route::prefix('admin')->name('admin.')->group(function () {

    Route::get('/', [DashboardController::class, 'index'])
        ->middleware('auth:admin');

    Route::get('/dashboard', [DashboardController::class, 'index'])
        ->middleware('auth:admin')
        ->name('dashboard');

/*    Route::get('/slider', [SliderController::class, 'index'])
        ->middleware('auth:admin')
        ->name('slide.index');

    Route::get('/slider/create', [SliderController::class, 'create'])
        ->middleware('auth:admin')
        ->name('slide.create');*/


//    Route::get('/register', [RegisteredUserController::class, 'create'])
//        ->middleware('guest:admin')
//        ->name('register');

//    Route::post('/register', [RegisteredUserController::class, 'store'])
//        ->middleware('guest:admin');

    Route::get('/login', [AuthenticatedSessionController::class, 'create'])
        ->middleware('guest:admin')
        ->name('login');

    Route::post('/login', [AuthenticatedSessionController::class, 'store'])
        ->middleware(['guest:admin', 'throttle:admin-login']);

    Route::get('/forgot-password', [PasswordResetLinkController::class, 'create'])
        ->middleware('guest:admin')
        ->name('password.request');

    Route::post('/forgot-password', [PasswordResetLinkController::class, 'store'])
        ->middleware('guest:admin')
        ->name('password.email');

    Route::get('/reset-password/{token}', [NewPasswordController::class, 'create'])
        ->middleware('guest:admin')
        ->name('password.reset');

    Route::post('/reset-password', [NewPasswordController::class, 'store'])
        ->middleware('guest:admin')
        ->name('password.update');

    Route::get('/verify-email', [EmailVerificationPromptController::class, '__invoke'])
        ->middleware('auth:admin')
        ->name('verification.notice');

    Route::get('/verify-email/{id}/{hash}', [VerifyEmailController::class, '__invoke'])
        ->middleware(['auth:admin', 'signed', 'throttle:6,1'])
        ->name('verification.verify');

    Route::post('/email/verification-notification', [EmailVerificationNotificationController::class, 'store'])
        ->middleware(['auth:admin', 'throttle:6,1'])
        ->name('verification.send');

    Route::get('/confirm-password', [ConfirmablePasswordController::class, 'show'])
        ->middleware('auth:admin')
        ->name('password.confirm');

    Route::post('/confirm-password', [ConfirmablePasswordController::class, 'store'])
        ->middleware('auth:admin');

    Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])
        ->middleware('auth:admin')
        ->name('logout');

    Route::post('/userCreate', [DashboardController::class, 'userCreate'])
        ->middleware('auth:admin')
        ->name('userCreate');


    Route::middleware('auth:admin')->group(function(){
        Route::resource('password-update', \App\Http\Controllers\Admin\PasswordUpdateController::class)
            ->only(['create','store']);
        Route::resource('profile-update', \App\Http\Controllers\Admin\ProfileUpdateController::class)
            ->only(['create','store']);
        Route::resource('user', \App\Http\Controllers\Admin\UserController::class);
        Route::post('subject/ai-suggest', [\App\Http\Controllers\Admin\SubjectController::class, 'aiSuggest'])->name('subject.aiSuggest');
        Route::resource('subject', \App\Http\Controllers\Admin\SubjectController::class)->except(['show']);
        Route::resource('session', \App\Http\Controllers\Admin\SessionController::class)->except(['show']);

        Route::get('student/export', [\App\Http\Controllers\Admin\StudentController::class, 'exportCsv'])->name('student.export');
        Route::post('student/import', [\App\Http\Controllers\Admin\StudentController::class, 'importCsv'])->name('student.import');
        Route::resource('student', \App\Http\Controllers\Admin\StudentController::class);
        Route::resource('exam', \App\Http\Controllers\Admin\ExamController::class);
        Route::resource('question', \App\Http\Controllers\Admin\QuestionController::class);
        Route::get('admit-card/{id}',[\App\Http\Controllers\Admin\StudentController::class,'admit'])->name('student.admit');
        Route::get('certificate/{id}',[\App\Http\Controllers\Admin\StudentController::class,'certificate'])->name('certificateStudent');
        Route::get('without-backgroundcertificate/{id}',[\App\Http\Controllers\Admin\StudentController::class,'certificateWithoutBackground'])->name('certificateWithoutBackground');

        Route::get('student-registration-form/{id}', [\App\Http\Controllers\Admin\StudentController::class, 'registrationForm'])->name('registrationForm');

        Route::resource('result', \App\Http\Controllers\Admin\ResultController::class)->only(['index','create','store','show']);
        Route::resource('slider', \App\Http\Controllers\Admin\SliderController::class);
        Route::get('user/portal/{user}', [\App\Http\Controllers\Admin\UserController::class, 'portal'])->name('user.portal');

        Route::resource('center', \App\Http\Controllers\Admin\CenterController::class);
        Route::patch('center/{center}/status', [\App\Http\Controllers\Admin\CenterController::class, 'updateStatus'])->name('center.updateStatus');
        Route::resource('notice', \App\Http\Controllers\Admin\NoticeController::class);
        Route::resource('adminList', \App\Http\Controllers\Admin\AdminListController::class)->only(['edit','update']);
        Route::resource('configDictionary', \App\Http\Controllers\Admin\ConfigDictionaryController::class)->only(['create','store']);
        Route::resource('team', \App\Http\Controllers\Admin\TeamController::class);
        Route::resource('sub-admin', \App\Http\Controllers\Admin\SubadminController::class);
        Route::resource('upazila-store', \App\Http\Controllers\Admin\UpazilaStoreController::class);

        Route::get('contactUs', [\App\Http\Controllers\Admin\ContactUsController::class, 'index'])->name('contactUs');
        Route::patch('contactUs/{id}/mark-read', [\App\Http\Controllers\Admin\ContactUsController::class, 'markAsRead'])->name('contactUs.markAsRead');
        Route::post('contactUs/{id}/ai-analyze', [\App\Http\Controllers\Admin\ContactUsController::class, 'aiAnalyze'])->name('contactUs.aiAnalyze');
        Route::delete('contactUs/{id}', [\App\Http\Controllers\Admin\ContactUsController::class, 'destroy'])->name('contactUs.destroy');
        Route::resource('translation', \App\Http\Controllers\Admin\TranslationController::class);
        Route::resource('sponsor', \App\Http\Controllers\Admin\SponsorController::class);
        Route::resource('backup', \App\Http\Controllers\Admin\BackupController::class)->only(['index','update']);
        Route::resource('whatapp-link', \App\Http\Controllers\Admin\WhatappLinkController::class);
        Route::resource('youtube-video', \App\Http\Controllers\Admin\YoutubeVideoController::class);
        Route::resource('license', \App\Http\Controllers\Admin\LicenseController::class);
        Route::resource('api-settings', \App\Http\Controllers\Admin\ApiSettingController::class)->only(['index', 'store']);
        Route::resource('footer-link', \App\Http\Controllers\Admin\FooterLinkController::class);
        Route::resource('footer-logo', \App\Http\Controllers\Admin\FooterPartnerLogoController::class);
    });
});
