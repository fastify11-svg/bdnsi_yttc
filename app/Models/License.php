<?php

namespace App\Models;

use App\Casts\ImageField;
use App\Traits\DeletesImage;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class License extends Model
{
    use DeletesImage;

    protected $fillable = [
        'cnic',
        'name',
        'father_name',
        'city',
        'state',
        'image',
        'license_number',
        'issue_date',
        'valid_from',
        'valid_to',
        'allowed_vehicles'
    ];

    protected $casts = [
        'issue_date' => 'datetime',
        'valid_from' => 'datetime',
        'valid_to' => 'datetime',
          'image'=>ImageField::class.":license,images/no-image.png"
    ];

    public static function getVehicleOptions()
    {
        return [
            'M' => 'M - Motorcycle',
            'CYCLE' => 'CYCLE - Bicycle',
            'CAR' => 'CAR - Car',
            'JEEP' => 'JEEP - Jeep'
        ];
    }
}
