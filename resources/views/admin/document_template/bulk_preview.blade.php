<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bulk Generation: {{ $template->name }}</title>
    <style>
        @page {
            size: {{ $template->width }} {{ $template->height }};
            margin: 0;
        }
        body {
            margin: 0;
            padding: 0;
            background-color: #f0f0f0; /* So user sees bounds before print */
            font-family: Arial, sans-serif;
        }
        .page-container {
            width: {{ $template->width }};
            height: {{ $template->height }};
            position: relative;
            background-image: url('{{ $template->background_image ? asset('storage/' . $template->background_image) : "" }}');
            background-size: 100% 100%;
            background-repeat: no-repeat;
            background-color: white;
            page-break-after: always;
            margin: 0 auto;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        /* Last page shouldn't break */
        .page-container:last-child {
            page-break-after: auto;
        }
        .dynamic-field {
            position: absolute;
            white-space: nowrap;
        }
        
        /* Print optimization */
        @media print {
            body {
                background-color: transparent;
                -webkit-print-color-adjust: exact;
            }
            .page-container {
                box-shadow: none;
                margin: 0;
            }
        }
    </style>
</head>
<body>

    @foreach($documents as $doc)
        <div class="page-container">
            @foreach($doc['mappedFields'] as $item)
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
                        <img src="data:image/svg+xml;base64,{{ $val }}" style="width:{{ $field->width ?? '100px' }}; height:{{ $field->height ?? '100px' }};" alt="QR Code" />
                    @elseif($type === 'qrcode_dummy')
                        <div style="width:{{ $field->width ?? '100px' }}; height:{{ $field->height ?? '100px' }}; border:2px dashed #333; display:flex; align-items:center; justify-content:center;">[QR]</div>
                    @elseif($type === 'image')
                        <img src="{{ $val }}" style="width:{{ $field->width ?? '120px' }}; height:{{ $field->height ?? '150px' }}; object-fit:cover;" alt="Student Photo" />
                    @elseif($type === 'image_dummy')
                        <div style="width:{{ $field->width ?? '120px' }}; height:{{ $field->height ?? '150px' }}; border:2px dashed #333; display:flex; align-items:center; justify-content:center;">[PHOTO]</div>
                    @elseif($type === 'html')
                        {!! $val !!}
                    @else
                        {{ $val }}
                    @endif
                </div>
            @endforeach
        </div>
    @endforeach

    <script>
        // Auto print on load to help the admin quickly generate PDF
        window.onload = function() {
            setTimeout(() => {
                window.print();
            }, 500);
        }
    </script>
</body>
</html>
