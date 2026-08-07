<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\DocumentTemplate;
use App\Models\Student;
use App\Services\DocumentGeneratorService;
use Illuminate\Http\Request;

class DocumentGenerationController extends Controller
{
    public function generate($template_id, $student_id, DocumentGeneratorService $generatorService)
    {
        $template = DocumentTemplate::with('fields')->findOrFail($template_id);
        $student = Student::findOrFail($student_id);

        $mappedFields = $generatorService->generateForStudent($template, $student);

        // We use the same preview view but now we pass mapped fields
        return view('admin.document_template.preview', compact('template', 'mappedFields', 'student'));
    }
}
