<?php

namespace Tests\Feature;

use App\Models\ConfigDictionary;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Support\Facades\Artisan;
use Tests\TestCase;

class FrontendE2ETest extends TestCase
{
    use RefreshDatabase;

    protected function setUp(): void
    {
        parent::setUp();
        
        // Ensure default configuration toggles are set to true (1) so pages are accessible.
        $toggles = [
            'module_student_result' => '1',
            'module_success_students' => '1',
            'module_notice_ticker' => '1',
            'module_verified_centers' => '1',
            'module_center_apply' => '1',
            'module_contact_us' => '1',
            'module_video_gallery' => '1'
        ];
        
        ConfigDictionary::setMany($toggles);
    }

    public function test_homepage_loads_successfully()
    {
        $response = $this->get(route('welcome'));
        $response->assertStatus(200);
    }

    public function test_all_courses_loads_successfully()
    {
        $response = $this->get(route('all_course'));
        $response->assertStatus(200);
    }

    public function test_student_result_loads_when_module_is_active()
    {
        $response = $this->get(route('result'));
        $response->assertStatus(200);
    }

    public function test_student_result_redirects_when_module_is_inactive()
    {
        ConfigDictionary::set('module_student_result', '0');

        $response = $this->get(route('result'));
        // Middleware uses abort(404) when module is disabled
        $response->assertStatus(404);
    }

    public function test_success_students_loads_successfully()
    {
        $response = $this->get(route('successStudent'));
        $response->assertStatus(200);
    }

    public function test_notice_board_loads_successfully()
    {
        $response = $this->get(route('frontendNoticeList'));
        $response->assertStatus(200);
    }

    public function test_verified_center_loads_successfully()
    {
        $response = $this->get(route('verifiedCenter'));
        $response->assertStatus(200);
    }

    public function test_center_apply_loads_successfully()
    {
        $response = $this->get(route('center-request.create'));
        $response->assertStatus(200);
    }

    public function test_contact_us_loads_successfully()
    {
        $response = $this->get(route('contactUs'));
        $response->assertStatus(200);
    }
}
