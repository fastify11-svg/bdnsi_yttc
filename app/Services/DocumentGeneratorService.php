<?php

namespace App\Services;

use App\Models\DocumentTemplate;
use App\Models\Student;
class DocumentGeneratorService
{
    /**
     * Map student data to template fields.
     */
    public function generateForStudent(DocumentTemplate $template, Student $student)
    {
        $mappedFields = [];

        // Load necessary relations if not loaded
        $student->loadMissing(['center', 'session', 'subject', 'result']);

        foreach ($template->fields as $field) {
            $mappedFields[] = [
                'field' => $field,
                'value' => $this->getVariableValue($field->variable_key, $student),
                'type' => $this->getVariableType($field->variable_key)
            ];
        }

        return $mappedFields;
    }

    private function getVariableType($key)
    {
        if ($key === 'qr_code') return 'qrcode';
        if ($key === 'student_image') return 'image';
        return 'text';
    }

    private function getVariableValue($key, Student $student)
    {
        switch ($key) {
            case 'student_name':
                return $student->name;
            case 'student_roll':
                return $student->roll;
            case 'student_registration':
                return $student->registration;
            case 'center_name':
                return $student->center->name ?? 'N/A';
            case 'session_name':
                return $student->session->name ?? 'N/A';
            case 'course_name':
                return $student->subject->name ?? 'N/A';
            case 'cgpa':
                return $student->result->cgpa ?? 'N/A';
            case 'grade':
                return $student->result->grade ?? 'N/A';
            case 'issue_date':
                return date('d M Y');
            case 'qr_code':
                // Will generate a base64 encoded QR linking to student's verification route
                $url = url('/student/result/' . ($student->registration ?? $student->id));
                return $this->generateQrCode($url);
            case 'student_image':
                return $student->picture ? asset('storage/' . $student->picture) : null;
            default:
                return '';
        }
    }

    private function generateQrCode($url)
    {
        // Generates SVG format
        try {
            $qrcode = new \SimpleSoftwareIO\QrCode\Generator;
            return base64_encode($qrcode->format('svg')->size(100)->generate($url));
        } catch (\Throwable $e) {
            return null; // Fallback if QR fails or package isn't installed yet
        }
    }
}
