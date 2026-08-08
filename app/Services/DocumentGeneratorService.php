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
        if ($key === 'semester_table_1_page') return 'html';
        if ($key === 'semester_table_8_page') return 'html';
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
            case 'semester_table_1_page':
                return $this->generateSemesterTable1Page($student);
            case 'semester_table_8_page':
                return $this->generateSemesterTable8Page($student);
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

    private function generateSemesterTable1Page(Student $student)
    {
        $semesters = $student->semesterResults;
        if (!$semesters || $semesters->isEmpty()) return 'No semester data found.';

        $html = '<table style="width:100%; border-collapse: collapse; font-size: 12px; margin-top: 20px;">';
        $html .= '<thead style="background:#f3f4f6;"><tr>';
        $html .= '<th style="border:1px solid #d1d5db; padding:6px;">Semester</th>';
        $html .= '<th style="border:1px solid #d1d5db; padding:6px;">Written</th>';
        $html .= '<th style="border:1px solid #d1d5db; padding:6px;">Practical</th>';
        $html .= '<th style="border:1px solid #d1d5db; padding:6px;">Viva</th>';
        $html .= '<th style="border:1px solid #d1d5db; padding:6px;">Total</th>';
        $html .= '</tr></thead><tbody>';

        foreach ($semesters as $sem) {
            $total = (int)$sem->written + (int)$sem->practical + (int)$sem->viva;
            $html .= '<tr>';
            $html .= '<td style="border:1px solid #d1d5db; padding:6px;">' . htmlspecialchars($sem->semester_name) . '</td>';
            $html .= '<td style="border:1px solid #d1d5db; padding:6px; text-align:center;">' . $sem->written . '</td>';
            $html .= '<td style="border:1px solid #d1d5db; padding:6px; text-align:center;">' . $sem->practical . '</td>';
            $html .= '<td style="border:1px solid #d1d5db; padding:6px; text-align:center;">' . $sem->viva . '</td>';
            $html .= '<td style="border:1px solid #d1d5db; padding:6px; text-align:center; font-weight:bold;">' . $total . '</td>';
            $html .= '</tr>';
        }
        $html .= '</tbody></table>';

        return $html;
    }

    private function generateSemesterTable8Page(Student $student)
    {
        $semesters = $student->semesterResults;
        if (!$semesters || $semesters->isEmpty()) return 'No semester data found.';

        $html = '';
        foreach ($semesters as $index => $sem) {
            $total = (int)$sem->written + (int)$sem->practical + (int)$sem->viva;
            // The magic is here: page-break-after! Except for the last one (optional, but harmless).
            $html .= '<div style="page-break-after: always; margin-bottom: 20px;">';
            
            $html .= '<h3 style="text-align:center; margin-bottom: 10px;">' . htmlspecialchars($sem->semester_name) . ' Marksheet</h3>';
            $html .= '<table style="width:100%; border-collapse: collapse; font-size: 14px;">';
            $html .= '<thead style="background:#f3f4f6;"><tr>';
            $html .= '<th style="border:1px solid #d1d5db; padding:8px;">Subject / Module</th>';
            $html .= '<th style="border:1px solid #d1d5db; padding:8px;">Marks</th>';
            $html .= '</tr></thead><tbody>';
            
            $html .= '<tr><td style="border:1px solid #d1d5db; padding:8px;">Written</td><td style="border:1px solid #d1d5db; padding:8px; text-align:center;">' . $sem->written . '</td></tr>';
            $html .= '<tr><td style="border:1px solid #d1d5db; padding:8px;">Practical</td><td style="border:1px solid #d1d5db; padding:8px; text-align:center;">' . $sem->practical . '</td></tr>';
            $html .= '<tr><td style="border:1px solid #d1d5db; padding:8px;">Viva</td><td style="border:1px solid #d1d5db; padding:8px; text-align:center;">' . $sem->viva . '</td></tr>';
            $html .= '<tr><td style="border:1px solid #d1d5db; padding:8px; font-weight:bold;">Total</td><td style="border:1px solid #d1d5db; padding:8px; text-align:center; font-weight:bold;">' . $total . '</td></tr>';
            
            $html .= '</tbody></table>';
            $html .= '</div>';
        }

        return $html;
    }
}
