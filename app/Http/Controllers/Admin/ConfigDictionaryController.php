<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Lib\Image;
use App\Models\ConfigDictionary;
use App\Models\SiteConfig;
use App\Traits\ChecksPermission;
use Illuminate\Http\Request;

class ConfigDictionaryController extends Controller
{
    use ChecksPermission;
    protected $permissionPrefix = 'configDictionary';
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    public function create()
    {
       return \Inertia\Inertia::render('Admin/ConfigDictionary/Create', [
           'settings' => SiteConfig::first()
       ]);
    }


    public function store(Request $request)
    {
        $config = SiteConfig::first() ?? new SiteConfig();

        $data = $request->except(['_token', '_method', 'created_at', 'main_logo', 'favicon', 'header_logo', 'footer_top_bg_image', 'footer_side_bg_image']);
        
        foreach (['main_logo', 'favicon', 'header_logo', 'footer_top_bg_image', 'footer_side_bg_image'] as $imageKey) {
            if ($request->hasFile($imageKey)) {
                $data[$imageKey] = Image::store($imageKey, 'config');
            } elseif ($request->has($imageKey) && !is_string($request->input($imageKey))) {
                unset($data[$imageKey]);
            }
        }

        $config->fill($data);
        $config->save();
        
        // BUG FIX: Sync all data to ConfigDictionary so the Frontend gets the updates instantly
        $allConfigData = $config->toArray();
        unset($allConfigData['id'], $allConfigData['created_at'], $allConfigData['updated_at']);
        
        $keyMap = [
            'portal_name' => 'site_name',
            'hotline_phone' => 'site_phone',
            'official_email' => 'site_email',
            'headquarter_address' => 'site_address',
            'marquee_notice' => 'notice',
            'about_short' => 'main_about_us',
        ];
        
        $mappedConfigData = [];
        foreach ($allConfigData as $key => $value) {
            $mappedKey = $keyMap[$key] ?? $key;
            $mappedConfigData[$mappedKey] = $value;
        }

        \App\Models\ConfigDictionary::setMany($mappedConfigData);
        
        return response()->report($config, 'Successfully Updated System Configuration');
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
