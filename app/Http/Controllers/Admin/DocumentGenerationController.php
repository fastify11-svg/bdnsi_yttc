<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\DocumentTemplate;
use App\Models\Student;
use App\Services\DocumentGeneratorService;
use Illuminate\Http\Request;

class DocumentGenerationController extends Controller
{
    protected $generatorService;

    public function __construct(DocumentGeneratorService $generatorService)
    {
        $this->generatorService = $generatorService;
    }

    public function generate($template_id, $student_id)
    {
        $template = DocumentTemplate::with('fields')->findOrFail($template_id);
        $student = Student::findOrFail($student_id);

        $mappedFields = $this->generatorService->generateForStudent($template, $student);

        return view('admin.document_template.preview', compact('template', 'mappedFields', 'student'));
    }

    /**
     * Generate documents for multiple students at once.
     */
    public function bulkGenerate(Request $request)
    {
        $request->validate([
            'template_id' => 'required|exists:document_templates,id',
            'student_ids' => 'required|array',
            'student_ids.*' => 'exists:students,id',
        ]);

        $template = DocumentTemplate::with('fields')->findOrFail($request->template_id);
        $students = Student::whereIn('id', $request->student_ids)->get();

        $documents = [];

        foreach ($students as $student) {
            $documents[] = [
                'student' => $student,
                'mappedFields' => $this->generatorService->generateForStudent($template, $student),
            ];
        }

        return view('admin.document_template.bulk_preview', compact('template', 'documents'));
    }
}
