<?php

namespace App\Http\Controllers;

use App\Enums\CenterStatus;
use App\Enums\StudentStatus;
use App\Models\Center;
use App\Models\SiteConfig;
use App\Models\ContactUs;
use App\Models\Exam;
use App\Models\License;
use App\Models\Notice;
use App\Models\Slider;
use App\Models\Student;
use App\Models\Subject;
use App\Models\Team;
use App\Models\YoutubeVideo;
use Illuminate\Http\Request;
use Inertia\Inertia;

class HomeController extends Controller
{
    public function index()
    {
        $config = SiteConfig::firstCached();

        $sliders = Slider::where('type', \App\Enums\SliderType::Slider)
            ->where('status', 1)
            ->orderBy('order_index', 'asc')
            ->orderBy('created_at', 'desc')
            ->get();
            
        if ($sliders->isEmpty()) {
            $sliders = Slider::where('status', 1)->orderBy('order_index', 'asc')->take(5)->get();
        }
        
        $sponsors = ($config['toggle_sponsors'] ?? '1') !== '0' ? Slider::where('type', \App\Enums\SliderType::Sponsor)->where('status', 1)->orderBy('order_index', 'asc')->take(30)->get() : collect([]);
        $photo_gallery = ($config['toggle_photo_gallery'] ?? '1') !== '0' ? Slider::where('type', \App\Enums\SliderType::Gallery)->where('status', 1)->orderBy('order_index', 'asc')->take(20)->get() : collect([]);

        $courses = Subject::orderBy('name', 'asc')->limit(7)->get();
        $teams = Team::where('status', 1)->orderBy('order_index', 'asc')->get();
        $youtube_videos = ($config['toggle_video_gallery'] ?? '1') !== '0' ? YoutubeVideo::where('status', 1)->take(6)->get() : collect([]);
        $notices = ($config['toggle_notice_board'] ?? '1') !== '0' ? Notice::latest()->take(5)->get() : collect([]);

        $centers = ($config['toggle_verified_centers'] ?? '1') !== '0' ? Center::where('status', CenterStatus::Approved)->take(8)->get() : collect([]);
        if ($centers->isEmpty() && ($config['toggle_verified_centers'] ?? '1') !== '0') {
            $centers = Center::take(8)->get();
        }

        $success_students = ($config['toggle_success_students'] ?? '1') !== '0' ? Student::where('status', StudentStatus::Approved)->take(12)->get() : collect([]);
        if ($success_students->isEmpty() && ($config['toggle_success_students'] ?? '1') !== '0') {
            $success_students = Student::take(12)->get();
        }

        $notice = $config->marquee_notice ?? 'মানসম্মত প্রশিক্ষণ গ্রহণ করে অনেক শিক্ষিত কিংবা অশিক্ষিত বেকার কর্মসংস্থান করতে পেরেছে। দেশের প্রায় সকল পাবলিক ও প্রাইভেট বিশ্ববিদ্যালয়ের সংশ্লিষ্ট ডিপার্টমেন্টের ছাত্র-ছাত্রী প্রশিক্ষণ গ্রহণ করছেন।';
        $about_us = $config->about_short ?? 'মানসম্মত প্রশিক্ষণ গ্রহণ করে অনেক শিক্ষিত কিংবা অশিক্ষিত বেকার কর্মসংস্থান করতে পেরেছে। দেশের প্রায় সকল পাবলিক ও প্রাইভেট বিশ্ববিদ্যালয়ের সংশ্লিষ্ট ডিপার্টমেন্টের ছাত্র-ছাত্রী প্রশিক্ষণ গ্রহণ করছেন। আমাদের অনেক ছাত্র-ছাত্রী দেশে এবং বিদেশে দক্ষতার সাথে কাজ করছেন। Computer Operator প্রশিক্ষণ নিয়েছেন। অনেক ছাত্র পণ্য উৎপাদনের প্রশিক্ষণ গ্রহণ করে কারখানা স্থাপন করেছেন।';

        $counts = [
            'total_centers' => Center::count() ?: 216,
            'total_courses' => Subject::count() ?: 532,
            'total_exams' => Exam::count() ?: 176,
            'total_students' => Student::count() ?: 54512,
        ];

        return Inertia::render('Welcome', [
            'sliders' => $sliders,
            'sponsors' => $sponsors,
            'photo_gallery' => $photo_gallery,
            'courses' => $courses,
            'teams' => $teams,
            'youtube_videos' => $youtube_videos,
            'notices' => $notices,
            'centers' => $centers,
            'success_students' => $success_students,
            'notice' => $notice,
            'about_us' => $about_us,
            'counts' => $counts,
            'site_config' => $config,
        ]);
    }

    public function verifiedCenter(Request $request)
    {
        $query = Center::where('status', CenterStatus::Approved);
        if ($request->search) {
            $query->where(function($q) use ($request) {
                $q->where('name', 'LIKE', '%' . $request->search . '%')
                  ->orWhere('code', 'LIKE', '%' . $request->search . '%');
            });
        }
        $centers = $query->latest()->paginate(18);

        if ($centers->isEmpty() && !$request->search) {
            $centers = Center::latest()->paginate(18);
        }

        return Inertia::render('VerifiedCenter', [
            'centers' => $centers,
            'filters' => $request->only(['search'])
        ]);
    }

    public function successStudent(Request $request)
    {
        $query = Student::where('status', StudentStatus::Approved);
        if ($request->search) {
            $query->where(function($q) use ($request) {
                $q->where('name', 'LIKE', '%' . $request->search . '%')
                  ->orWhere('roll', 'LIKE', '%' . $request->search . '%');
            });
        }
        $students = $query->latest()->paginate(24);

        if ($students->isEmpty() && !$request->search) {
            $students = Student::latest()->paginate(24);
        }

        return Inertia::render('SuccessStudent', [
            'students' => $students,
            'filters' => $request->only(['search'])
        ]);
    }

    public function all_course(Request $request)
    {
        $courses = Subject::when($request->course_name, function ($q) use ($request) {
            return $q->where(function($sub) use ($request) {
                $sub->where('name', 'LIKE', '%' . $request->course_name . '%')
                    ->orWhere('code', 'LIKE', '%' . $request->course_name . '%')
                    ->orWhere('education_qualification', 'LIKE', '%' . $request->course_name . '%');
            });
        })->latest()->paginate(40)->withQueryString();

        return Inertia::render('AllCourse', compact('courses'));
    }

    public function contactUs(Request $request)
    {
        if ($request->isMethod('post')) {
            $validated = $request->validate([
                'name' => 'required|string|max:255',
                'email' => 'required|email|max:255',
                'phone' => 'required|string|max:50',
                'subject' => 'nullable|string|max:255',
                'message' => 'required|string',
            ]);

            ContactUs::create([
                'name' => $validated['name'],
                'email' => $validated['email'],
                'phone' => $validated['phone'],
                'message' => ($validated['subject'] ? '[Subject: ' . $validated['subject'] . '] ' : '') . $validated['message'],
            ]);

            return redirect()->back()->with('success', 'Thank you! Your message has been sent successfully. We will get back to you soon.');
        }

        return Inertia::render('ContactUs');
    }

    public function dynamicPage(Request $request, $type = null)
    {
        $content = '';
        $title = '';
        
        if ($type === 'terms') {
            $title = 'Terms & Conditions';
            $content = \App\Models\SiteConfig::firstCached()->terms_conditions ?? '';
        } elseif ($type === 'privacy') {
            $title = 'Privacy Policy';
            $content = \App\Models\SiteConfig::firstCached()->privacy_policy ?? '';
        } elseif ($type === 'about') {
            $title = 'About Us';
            $content = \App\Models\SiteConfig::firstCached()->about_full ?? '';
        } else {
            abort(404);
        }
        
        return Inertia::render('DynamicPage', [
            'title' => $title,
            'content' => $content
        ]);
    }

    public function frontendNoticeList()
    {
        $notices = Notice::latest()->paginate(15);
        return Inertia::render('NoticeList', compact('notices'));
    }

    public function courseDetails($id)
    {
        $course = Subject::findOrFail($id);
        $related_courses = Subject::where('id', '!=', $id)->inRandomOrder()->limit(4)->get();
        return Inertia::render('CourseDetails', compact('course', 'related_courses'));
    }

    public function instituteDetails($id)
    {
        $institute = Center::findOrFail($id);
        return Inertia::render('InstituteDetails', compact('institute'));
    }

    public function noticeDetails($id)
    {
        $notice = Notice::findOrFail($id);
        return Inertia::render('NoticeDetails', compact('notice'));
    }

    public function license($number = null)
    {
        $data = License::where('license_number', $number)->first();
        return Inertia::render('LicenseView', ['data' => $data]);
    }

    public function videoGallery()
    {
        $videos = YoutubeVideo::where('status', 1)->latest()->paginate(12);
        return Inertia::render('VideoGallery', compact('videos'));
    }
}
