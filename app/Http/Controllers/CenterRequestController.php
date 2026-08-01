<?php

namespace App\Http\Controllers;

use App\Http\Requests\CenterStoreRequest;
use App\Models\District;
use App\Models\Upazila;

class CenterRequestController extends Controller
{
    public function create()
    {
        return \Inertia\Inertia::render('CenterRequest/Create', [
            'divisions' => \App\Models\Division::get(),
            'districts' => District::get()->mapWithKeys(function ($district) {
                return [
                    $district->id => [
                        'division_id' => $district->division_id,
                        'name' => $district->name,
                    ]
                ];
            }),
            'upazilas' => Upazila::get()->mapWithKeys(function ($upazila) {
                return [
                    $upazila->id => [
                        'district_id' => $upazila->district_id,
                        'name' => $upazila->name,
                    ]
                ];
            })->toArray()
        ]);
    }

    public function store(CenterStoreRequest $request)
    {

        return response()->report(
            $request->store(),
            'Center request submitted successfully'
        );
    }
}
