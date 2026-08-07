<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Preview: {{ $template->name }}</title>
    <style>
        @page {
            size: {{ $template->width }} {{ $template->height }};
            margin: 0;
        }
        body {
            margin: 0;
            padding: 0;
            width: {{ $template->width }};
            height: {{ $template->height }};
            position: relative;
            background-image: url('{{ $template->background_image ? asset('storage/' . $template->background_image) : "" }}');
            background-size: 100% 100%;
            background-repeat: no-repeat;
            font-family: Arial, sans-serif;
        }
        .dynamic-field {
            position: absolute;
            white-space: nowrap;
        }
        
        /* Print optimization */
        @media print {
            body {
                -webkit-print-color-adjust: exact;
            }
        }
    </style>
</head>
<body>

    @foreach($template->fields as $field)
        <div class="dynamic-field" style="
            left: {{ $field->position_x }};
            top: {{ $field->position_y }};
            font-size: {{ $field->font_size ?? '16px' }};
            font-family: {{ $field->font_family ?? 'Arial' }};
            font-weight: {{ $field->font_weight ?? 'normal' }};
            color: {{ $field->color ?? '#000000' }};
            text-align: {{ $field->text_align ?? 'left' }};
        ">
            [{{ $field->variable_key }}]
        </div>
    @endforeach

    <script>
        // Auto print on load for testing
        // window.onload = function() { window.print(); }
    </script>
</body>
</html>
