<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ConfigDictionary;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ApiSettingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Inertia\Response
     */
    public function index()
    {
        $apiSettings = ConfigDictionary::get('api_settings', []);
        
        return Inertia::render('Admin/ApiSetting/Index', [
            'api_settings' => $apiSettings
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'gemini_api_key' => 'nullable|string'
        ]);

        ConfigDictionary::set('api_settings', $data);
        
        return redirect()->back()->with('success', 'API Settings updated successfully.');
    }
}
