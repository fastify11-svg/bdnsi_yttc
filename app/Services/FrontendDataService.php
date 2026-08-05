<?php

namespace App\Services;

use App\Enums\CenterStatus;
use App\Enums\StudentStatus;
use App\Models\Center;
use App\Models\SiteConfig;
use App\Models\Exam;
use App\Models\Notice;
use App\Models\Slider;
use App\Models\Student;
use App\Models\Subject;
use App\Models\Team;
use App\Models\YoutubeVideo;

class FrontendDataService
{
    public function getHomepageData()
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
        
        $sponsors = SiteConfig::isEnabled('toggle_sponsors') ? Slider::where('type', \App\Enums\SliderType::Sponsor)->where('status', 1)->orderBy('order_index', 'asc')->take(30)->get() : collect([]);
        $photo_gallery = SiteConfig::isEnabled('toggle_photo_gallery') ? Slider::where('type', \App\Enums\SliderType::Gallery)->where('status', 1)->orderBy('order_index', 'asc')->take(20)->get() : collect([]);

        $courses = Subject::orderBy('name', 'asc')->limit(7)->get();
        $teams = Team::where('status', 1)->orderBy('order_index', 'asc')->get();
        $youtube_videos = SiteConfig::isEnabled('toggle_video_gallery') ? YoutubeVideo::where('status', 1)->take(6)->get() : collect([]);
        $notices = SiteConfig::isEnabled('toggle_notice_board') ? Notice::latest()->take(5)->get() : collect([]);

        $centers = SiteConfig::isEnabled('toggle_verified_centers') ? Center::where('status', CenterStatus::Approved)->take(8)->get() : collect([]);
        if ($centers->isEmpty() && SiteConfig::isEnabled('toggle_verified_centers')) {
            $centers = Center::take(8)->get();
        }

        $success_students = SiteConfig::isEnabled('toggle_success_students') ? Student::where('status', StudentStatus::Approved)->take(12)->get() : collect([]);
        if ($success_students->isEmpty() && SiteConfig::isEnabled('toggle_success_students')) {
            $success_students = Student::take(12)->get();
        }

        $notice = $config->marquee_notice ?? config('site.defaults.notice');
        $about_us = $config->about_short ?? config('site.defaults.about_us');

        $counts = [
            'total_centers' => Center::count() ?: config('site.defaults.total_centers'),
            'total_courses' => Subject::count() ?: config('site.defaults.total_courses'),
            'total_exams' => Exam::count() ?: config('site.defaults.total_exams', 176),
            'total_students' => Student::count() ?: config('site.defaults.total_students', 54512),
        ];

        return [
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
        ];
    }
}
