<?php

namespace App\Http\Controllers;

use App\Enums\SessionStatus;
use App\Enums\StudentStatus;
use App\Models\Session;
use App\Models\Student;
use App\Models\Subject;
use Illuminate\Http\Request;

class CenterTotalResultController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function __invoke(Request $request)
    {

          if ($request->has(['session_id','subject_id'])){
               $students = Student::with('result','subject:id,name','session:id,name')->where('center_id',auth()->user()->center_id)->where(['session_id'=> $request->session_id, 'subject_id'=>$request->subject_id])->get();

              return \Inertia\Inertia::render('Center/Student/Result', [
                  'students'=>$students,
                  'sessions' => Session::select(['id', 'name'])->where('status',SessionStatus::Active)->get(),
                  'subjects' => Subject::select(['id', 'name'])->get(),
              ]);
          }

        return \Inertia\Inertia::render('Center/Student/Result', [
            'students'=> [],
            'sessions' => Session::select(['id', 'name'])->where('status',SessionStatus::Active)->get(),
            'subjects' => Subject::select(['id', 'name'])->get(),
        ]);





    }
}
