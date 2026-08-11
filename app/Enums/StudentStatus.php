<?php

namespace App\Enums;

use BenSampo\Enum\Enum;

/**
 * @method static static Pending()
 * @method static static Requested()
 * @method static static Approved()
 * @method static static Hide()
 */
final class StudentStatus extends Enum
{
    const Pending = 0;

    const Requested = 1;

    const Approved = 2;

    const Hide = 3;

    public static function getStatus()
    {
        return [
            'Pending' => 0,
            'Requested' => 1,
            'Approved' => 2,
            'Hide' => 3,
        ];
    }
}
