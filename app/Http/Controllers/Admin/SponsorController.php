<?php

namespace App\Http\Controllers\Admin;

use App\Enums\SliderType;
use App\Http\Controllers\Controller;
use App\Models\Slider;
use App\Traits\ChecksPermission;
use Illuminate\Http\Request;

class SponsorController extends Controller
{

    use ChecksPermission;
    protected $permissionPrefix = 'sponsor';
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
          if ($request->ajax() && !$request->header('X-Inertia')) {
               return  datatables(Slider::where('type',SliderType::Sponsor))->addIndexColumn()->toJson();
          }
        $sponsors = Slider::where('type', \App\Enums\SliderType::Sponsor)->latest()->paginate(25);
        return \Inertia\Inertia::render('Admin/Sponsor/Index', compact('sponsors'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return  view('admin.sponsor.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'nullable|string',
            'photo' => 'required|image',
        ]);

        $validated['type'] = \App\Enums\SliderType::Sponsor;
        $validated['photo'] = \App\Lib\Image::store('photo','upload/slider');

        $sponsor = Slider::create($validated);

        return response()->report($sponsor, 'Sponsor Created successfully');
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($id)
    {
        $sponsor = Slider::findOrFail($id);
        $sponsor->delete();
        
        return response()->report($sponsor, 'Sponsor Deleted successfully');
    }
}
