<?php

namespace App\Services;

use App\Models\DocumentTemplate;
use App\Models\Student;
use SimpleSoftwareIO\QrCode\Generator;

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
                'type' => $this->getVariableType($field->variable_key),
            ];
        }

        return $mappedFields;
    }

    private function getVariableType($key)
    {
        if ($key === 'qr_code') {
            return 'qrcode';
        }
        if ($key === 'student_image') {
            return 'image';
        }
        if ($key === 'semester_table_1_page') {
            return 'html';
        }
        if ($key === 'semester_table_8_page') {
            return 'html';
        }

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
                $url = url('/verify?reg='.urlencode($student->registration ?? $student->id));

                return $this->generateQrCode($url);
            case 'student_image':
                return $student->picture ? asset('storage/'.$student->picture) : null;
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
            $qrcode = new Generator;

            return base64_encode($qrcode->format('svg')->size(100)->generate($url));
        } catch (\Throwable $e) {
            return null; // Fallback if QR fails or package isn't installed yet
        }
    }

    private function generateSemesterTable1Page(Student $student)
    {
        $semesters = $student->semesterResults;
        if (! $semesters || $semesters->isEmpty()) {
            return 'No semester data found.';
        }

        $html = '<div style="display: flex; flex-wrap: wrap; gap: 15px; justify-content: space-between; width: 100%;">';

        foreach ($semesters as $sem) {
            $html .= '<div style="width: 48%; margin-bottom: 15px; box-sizing: border-box;">';
            $html .= '<h4 style="text-align:center; margin-bottom: 5px; font-size: 14px; margin-top: 0;">'.htmlspecialchars($sem->semester_name).'</h4>';
            $html .= '<table style="width:100%; border-collapse: collapse; font-size: 11px; text-align:center;">';
            $html .= '<thead style="background:#f3f4f6;"><tr>';
            $html .= '<th style="border:1px solid #d1d5db; padding:4px; text-align:left;">Subject</th>';
            $html .= '<th style="border:1px solid #d1d5db; padding:4px;">Cr</th>';
            $html .= '<th style="border:1px solid #d1d5db; padding:4px;">Gr</th>';
            $html .= '<th style="border:1px solid #d1d5db; padding:4px;">Pt</th>';
            $html .= '</tr></thead><tbody>';

            $subjects = $sem->subjects_data ?? [];
            if (is_string($subjects)) {
                $subjects = json_decode($subjects, true) ?? [];
            }

            $totalCredit = 0;
            $totalPoints = 0;
            foreach ($subjects as $sub) {
                $html .= '<tr>';
                // Truncate long subject names if necessary to fit the grid
                $subjName = htmlspecialchars($sub['name'] ?? '');
                if (strlen($subjName) > 25) {
                    $subjName = substr($subjName, 0, 22) . '...';
                }
                $html .= '<td style="border:1px solid #d1d5db; padding:4px; text-align:left;">'.$subjName.'</td>';
                $html .= '<td style="border:1px solid #d1d5db; padding:4px;">'.($sub['credit'] ?? '').'</td>';
                $html .= '<td style="border:1px solid #d1d5db; padding:4px;">'.($sub['grade'] ?? '').'</td>';
                $html .= '<td style="border:1px solid #d1d5db; padding:4px;">'.number_format($sub['total_point'] ?? 0, 2).'</td>';
                $html .= '</tr>';
                $totalCredit += ($sub['credit'] ?? 0);
                $totalPoints += ($sub['total_point'] ?? 0);
            }

            $html .= '</tbody></table>';
            $html .= '<div style="text-align: right; font-weight: bold; font-size: 12px; margin-top: 5px;">GPA: '.number_format($sem->semester_gpa, 2).'</div>';
            $html .= '</div>';
        }
        $html .= '</div>';

        return $html;
    }

    private function generateSemesterTable8Page(Student $student)
    {
        $semesters = $student->semesterResults;
        if (! $semesters || $semesters->isEmpty()) {
            return 'No semester data found.';
        }

        $html = '';
        foreach ($semesters as $index => $sem) {
            // The magic is here: page-break-after! Except for the last one (optional, but harmless).
            $html .= '<div class="html2pdf__page-break" style="page-break-after: always; margin-bottom: 20px;">';

            $html .= '<h3 style="text-align:center; margin-bottom: 10px;">'.htmlspecialchars($sem->semester_name).' Marksheet</h3>';
            $html .= '<table style="width:100%; border-collapse: collapse; font-size: 14px; text-align:center;">';
            $html .= '<thead style="background:#f3f4f6;"><tr>';
            $html .= '<th style="border:1px solid #d1d5db; padding:8px; text-align:left;">Subject / Module</th>';
            $html .= '<th style="border:1px solid #d1d5db; padding:8px;">Credit (C)</th>';
            $html .= '<th style="border:1px solid #d1d5db; padding:8px;">Grade</th>';
            $html .= '<th style="border:1px solid #d1d5db; padding:8px;">Grade Point (G)</th>';
            $html .= '<th style="border:1px solid #d1d5db; padding:8px;">Total Point (C &times; G)</th>';
            $html .= '</tr></thead><tbody>';

            $subjects = $sem->subjects_data ?? [];
            if (is_string($subjects)) {
                $subjects = json_decode($subjects, true) ?? [];
            }

            $totalCredit = 0;
            $totalPoints = 0;
            foreach ($subjects as $sub) {
                $html .= '<tr>';
                $html .= '<td style="border:1px solid #d1d5db; padding:8px; text-align:left;">'.htmlspecialchars($sub['name'] ?? '').'</td>';
                $html .= '<td style="border:1px solid #d1d5db; padding:8px;">'.($sub['credit'] ?? '').'</td>';
                $html .= '<td style="border:1px solid #d1d5db; padding:8px;">'.($sub['grade'] ?? '').'</td>';
                $html .= '<td style="border:1px solid #d1d5db; padding:8px;">'.number_format($sub['point'] ?? 0, 2).'</td>';
                $html .= '<td style="border:1px solid #d1d5db; padding:8px;">'.number_format($sub['total_point'] ?? 0, 2).'</td>';
                $html .= '</tr>';
                $totalCredit += ($sub['credit'] ?? 0);
                $totalPoints += ($sub['total_point'] ?? 0);
            }

            $html .= '<tr style="background:#f9fafb; font-weight:bold;">';
            $html .= '<td style="border:1px solid #d1d5db; padding:8px; text-align:right;">Total</td>';
            $html .= '<td style="border:1px solid #d1d5db; padding:8px;">'.$totalCredit.'</td>';
            $html .= '<td style="border:1px solid #d1d5db; padding:8px;"></td>';
            $html .= '<td style="border:1px solid #d1d5db; padding:8px;"></td>';
            $html .= '<td style="border:1px solid #d1d5db; padding:8px;">'.number_format($totalPoints, 2).'</td>';
            $html .= '</tr>';

            $html .= '</tbody></table>';

            $html .= '<div style="margin-top: 10px; text-align: right; font-weight: bold; font-size: 16px;">';
            $html .= 'Semester GPA: '.number_format($sem->semester_gpa, 2);
            $html .= '</div>';

            $html .= '</div>';
        }

        return $html;
    }
}
