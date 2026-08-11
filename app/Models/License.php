<?php

namespace App\Models;

use App\Casts\ImageField;
use App\Traits\DeletesImage;
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
        'allowed_vehicles',
    ];

    protected $casts = [
        'issue_date' => 'datetime',
        'valid_from' => 'datetime',
        'valid_to' => 'datetime',
        'image' => ImageField::class.':license,images/no-image.png',
    ];

    // Custom accessor for allowed_vehicles
    public function getAllowedVehiclesAttribute($value)
    {
        if (empty($value)) {
            return [];
        }

        // If it's already an array (from JSON), return it
        if (is_array($value)) {
            return $value;
        }

        // If it's a JSON string, decode it
        $decoded = json_decode($value, true);
        if (json_last_error() === JSON_ERROR_NONE) {
            return $decoded;
        }

        // If it's a single string value, return as array
        return [$value];
    }

    // Custom mutator for allowed_vehicles
    public function setAllowedVehiclesAttribute($value)
    {
        if (is_array($value)) {
            $this->attributes['allowed_vehicles'] = json_encode($value);
        } else {
            $this->attributes['allowed_vehicles'] = $value;
        }
    }

    public static function getVehicleOptions()
    {
        return [
            'M' => 'M - Motorcycle',
            'CYCLE' => 'CYCLE - Bicycle',
            'CAR' => 'CAR - Car',
            'JEEP' => 'JEEP - Jeep',
        ];
    }
}
