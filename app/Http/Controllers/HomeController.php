<?php

namespace App\Http\Controllers;

use App\Models\ConfigDictionary;
use App\Models\ContactUs;
use App\Models\License;
use App\Models\Slider;
use App\Models\Subject;
use App\Models\Team;
use App\Models\YoutubeVideo;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        $sliders = Slider::all();
        $courses = Subject::orderBy('name', 'asc')->limit(5)->get();
        $teams = Team::get();
        $youtube_videos=YoutubeVideo::where('status',1)->take(5)->get();
        return view('welcome', compact('courses', 'sliders', 'teams','youtube_videos'));
    }

    public function all_course(Request $request)
    {
        $courses = Subject::when($request->course_name, function ($q) use ($request) {
            return $q->where('name', 'LIKE', '%' . $request->course_name . '%');
        })->paginate(40);
        return view('all_course', compact('courses'));
    }

    public function contactUs(Request $request)
    {
        if ($request->post()) {
            $validated = $request->validate([
                'name' => 'required',
                'email' => 'required|email',
                'phone' => 'required|numeric',
                'message' => 'required',
            ]);
            return response()->report(ContactUs::create($validated), 'Successfully Done Your Message');
        }
        return view('page.contact');
    }


    public function dymamicPage(Request $request)
    {

        if ($request->about_us) {
            $about_us = ConfigDictionary::get('about_us');
            return view('page.dynamic_page', compact('about_us'));
        } elseif ($request->terms_and_condition) {
            $terms_and_condition = ConfigDictionary::get('terms_and_condition');
            return view('page.dynamic_page', compact('terms_and_condition'));
        } elseif ($request->privacy_policy) {
            $privacy_policy = ConfigDictionary::get('privacy_policy');
            return view('page.dynamic_page', compact('privacy_policy'));
        }

        return view('page.dynamic_page');
    }


    public function frontendNoticeList()
    {
        $notices = \App\Models\Notice::paginate(15);
        return view('noticeList', compact('notices'));
    }

    public function courseDetails($id)
    {
        $data = \App\Models\Subject::findOrFail($id);

        return view('course_details', compact('data'));
    }

    public function instituteDetails($id)
    {
        $data = \App\Models\Center::findOrFail($id);
        return view('institute_details', compact('data'));
    }

    public function noticeDetails($id)
    {
        $data = \App\Models\Notice::findOrFail($id);
        return view('noticeDetails', compact('data'));
    }


    public function license($number)
    {
         $data=License::where('license_number',$number)->first();
        return view('license',['data'=>$data]);
    }


}
