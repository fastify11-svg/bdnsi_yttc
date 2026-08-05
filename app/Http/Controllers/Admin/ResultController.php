<?php

namespace App\Http\Controllers\Admin;

use App\Enums\CenterStatus;
use App\Enums\SessionStatus;
use App\Enums\StudentStatus;
use App\Http\Controllers\Controller;
use App\Lib\Helper;
use App\Models\Center;
use App\Models\Result;
use App\Models\Session;
use App\Models\Student;
use App\Models\Subject;
use App\Traits\ChecksPermission;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ResultController extends Controller
{
    use ChecksPermission;
    protected $permissionPrefix = 'result';
    public function index(Request $request)
    {
        $students = collect([]);
        if ($request->has(['center', 'session', 'subject'])) {
            $students = Student::where([
                'center_id' => $request->get('center'),
                'session_id' => $request->get('session'),
                'subject_id' => $request->get('subject'),
            ])
            ->whereStatus(StudentStatus::Approved)
            ->with('result')->get();
        }

        return \Inertia\Inertia::render('Admin/Result/Index', [
            'students' => $students,
            'centers' => Center::select(['id', 'code', 'name'])->whereStatus(CenterStatus::Approved)->get(),
            'sessions' => Session::select(['id', 'name'])->where('status',SessionStatus::Active)->get(),
            'subjects' => Subject::select(['id', 'name'])->get(),
        ]);
    }

    public function create(Request $request)
    {
        $students = collect([]);
        if ($request->has(['roll'])) {
            $students = Student::where(
                'roll',$request->get('roll'))
            ->whereStatus(StudentStatus::Approved)
            ->with('result')->get();
        }

        return \Inertia\Inertia::render('Admin/Result/Create', [
            'students' => $students,
            'centers' => Center::select(['id', 'code', 'name'])->whereStatus(CenterStatus::Approved)->get(),
            'sessions' => Session::select(['id', 'name'])->where('status',SessionStatus::Active)->get(),
            'subjects' => Subject::select(['id', 'name'])->get(),
        ]);
    }

    public function store(Request $request)
    {

        $request->validate([
            'id' => 'required',
            'written' => 'required|numeric',
            'practical' => 'required|numeric',
            'viva' => 'required|numeric',
        ]);

        try {
            $written = $request->get('written');
            $practical = $request->get('practical');
            $viva = $request->get('viva');
            DB::beginTransaction();
                $student=Student::find($request->id);
                Result::updateOrCreate(['student_id' => $request->id],
                    [
                        'written' => $written,
                        'practical' => $practical,
                        'viva' => $viva,
                    ]);
                $message = 'Congratulation!! ' . $student->name . ', You have successfully filled the application form for  '.$student->center->name .' ' . $student->subject->name . ' course under Young Technical Training. Your Roll No: ' . $student->roll .' and Registration No: ' . $student->registration . '. Thanks for staying with '.config('site.setting.name');
                \App\Jobs\SendStudentSmsJob::dispatch($student->phone, $message);

            DB::commit();
            return response()->success('Result published successfully');
        } catch (\Exception $ex) {
            DB::rollBack();
            return $ex;
        }
        return response()->error('Something went wrong');
    }

    public function show(  $id)
    {
        $student = \App\Models\Student::findOrFail($id);
        $student->load(['result', 'center', 'session', 'subject']);
        return \Inertia\Inertia::render('Admin/Result/Show', [
            'student' => $student
        ]);
    }

    public function destroy(Result $result)
    {
        //
    }
}
