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

    @foreach($mappedFields ?? $template->fields as $item)
        @php
            $isMapped = isset($item['value']);
            $field = $isMapped ? $item['field'] : $item;
            $val = $isMapped ? $item['value'] : '[' . $field->variable_key . ']';
            $type = $isMapped ? $item['type'] : 'text';
            if (!$isMapped) {
                if ($field->variable_key === 'qr_code') $type = 'qrcode_dummy';
                if ($field->variable_key === 'student_image') $type = 'image_dummy';
            }
        @endphp
        <div class="dynamic-field" style="
            left: {{ $field->position_x }};
            top: {{ $field->position_y }};
            font-size: {{ $field->font_size ?? '16px' }};
            font-family: {{ $field->font_family ?? 'Arial' }};
            font-weight: {{ $field->font_weight ?? 'normal' }};
            color: {{ $field->color ?? '#000000' }};
            text-align: {{ $field->text_align ?? 'left' }};
        ">
            @if($type === 'qrcode')
                <img src="data:image/svg+xml;base64,{{ $val }}" style="width:100px; height:100px;" alt="QR Code" />
            @elseif($type === 'qrcode_dummy')
                <div style="width:100px; height:100px; border:2px dashed #333; display:flex; align-items:center; justify-content:center;">[QR]</div>
            @elseif($type === 'image')
                <img src="{{ $val }}" style="width:120px; height:150px; object-fit:cover;" alt="Student Photo" />
            @elseif($type === 'image_dummy')
                <div style="width:120px; height:150px; border:2px dashed #333; display:flex; align-items:center; justify-content:center;">[PHOTO]</div>
            @else
                {{ $val }}
            @endif
        </div>
    @endforeach

    <script>
        // Auto print on load for testing
        // window.onload = function() { window.print(); }
    </script>
</body>
</html>
