<?php
require 'vendor/autoload.php';
$app = require_once 'bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

use App\Models\Session;

$sessions = Session::all();
$count = 0;

$monthsMap = [
    'jan' => 1, 'january' => 1, 'feb' => 2, 'february' => 2, 'mar' => 3, 'march' => 3,
    'apr' => 4, 'april' => 4, 'may' => 5, 'jun' => 6, 'june' => 6, 'jul' => 7, 'july' => 7,
    'aug' => 8, 'august' => 8, 'sep' => 9, 'september' => 9, 'oct' => 10, 'october' => 10,
    'nov' => 11, 'november' => 11, 'dec' => 12, 'december' => 12,
];

foreach ($sessions as $session) {
    $name = strtolower(trim($session->name));
    $name = preg_replace('/ - /', ' to ', $name);
    $name = preg_replace('/-/', ' to ', $name);
    $name = preg_replace('/\s{2,}/', ' ', $name);
    // Remove specific days
    $name = preg_replace('/\b\d{1,2}\s+(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)[a-z]*\b/', '$1', $name);

    $startMonth = 1; $startYear = null; $endMonth = 12; $endYear = null;

    if (preg_match('/^(\d{4})\s*to\s*(\d{4})$/', $name, $match)) {
        $startYear = (int)$match[1]; $endYear = (int)$match[2];
    } elseif (preg_match('/^([a-z]+)\s*to\s*([a-z]+)\s*(\d{4})$/', $name, $match)) {
        if (isset($monthsMap[$match[1]]) && isset($monthsMap[$match[2]])) {
            $startMonth = $monthsMap[$match[1]]; $endMonth = $monthsMap[$match[2]];
            $startYear = (int)$match[3]; $endYear = (int)$match[3];
        }
    } elseif (preg_match('/^([a-z]+)\s*(\d{4})(?:\s*to\s*|\s+)([a-z]+)\s*(\d{4})$/', $name, $match)) {
        if (isset($monthsMap[$match[1]]) && isset($monthsMap[$match[3]])) {
            $startMonth = $monthsMap[$match[1]]; $startYear = (int)$match[2];
            $endMonth = $monthsMap[$match[3]]; $endYear = (int)$match[4];
        }
    } elseif (preg_match('/^(\d{4})\s*([a-z]+)\s*to\s*(\d{4})\s*([a-z]+)$/', $name, $match)) {
        if (isset($monthsMap[$match[2]]) && isset($monthsMap[$match[4]])) {
            $startYear = (int)$match[1]; $startMonth = $monthsMap[$match[2]];
            $endYear = (int)$match[3]; $endMonth = $monthsMap[$match[4]];
        }
    } elseif (preg_match('/^([a-z]+)\s*(\d{4})\s*to\s*continuing$/', $name, $match)) {
        if (isset($monthsMap[$match[1]])) {
            $startMonth = $monthsMap[$match[1]]; $startYear = (int)$match[2];
            $endMonth = (int)date('n'); $endYear = (int)date('Y');
        }
    } else {
        // Just extract years if possible
        if (preg_match_all('/\b(20\d{2})\b/', $name, $matches)) {
            if (count($matches[1]) == 2) {
                $startYear = (int)$matches[1][0]; $endYear = (int)$matches[1][1];
            } elseif (count($matches[1]) == 1) {
                $startYear = (int)$matches[1][0]; $endYear = $startYear;
            }
        }
    }

    if ($startYear !== null && $endYear !== null) {
        $duration = (($endYear - $startYear) * 12) + ($endMonth - $startMonth) + 1;

        if ($duration == 5 || $duration == 7) $duration = 6;
        if ($duration == 11 || $duration == 13) $duration = 12;
        if ($duration == 17 || $duration == 19) $duration = 18;
        if ($duration == 23 || $duration == 25) $duration = 24;
        if ($duration == 35 || $duration == 37) $duration = 36;
        if ($duration == 47 || $duration == 49) $duration = 48;
        
        if ($duration <= 0) {
            $duration = 12; // default 1 year if logic fails
        }

        $session->duration = $duration;

        if (empty($session->exam_date)) {
            $session->exam_date = sprintf('%04d-%02d-20', $endYear, $endMonth);
        }

        if (empty($session->result_published_date)) {
            $resMonth = $endMonth + 1;
            $resYear = $endYear;
            if ($resMonth > 12) {
                $resMonth = 1;
                $resYear += 1;
            }
            $session->result_published_date = sprintf('%04d-%02d-10', $resYear, $resMonth);
        }

        $session->save();
        $count++;
    }
}
echo "Successfully repaired durations and dates for $count sessions.";
