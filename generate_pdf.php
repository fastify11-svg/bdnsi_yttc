<?php

$pdfContent = "%PDF-1.4\n1 0 obj\n<< /Type /Catalog /Pages 2 0 R >>\nendobj\n2 0 obj\n<< /Type /Pages /Kids [3 0 R] /Count 1 >>\nendobj\n3 0 obj\n<< /Type /Page /Parent 2 0 R /MediaBox [0 0 612 792] /Contents 4 0 R /Resources << /Font << /F1 << /Type /Font /Subtype /Type1 /BaseFont /Helvetica >> >> >> >>\nendobj\n4 0 obj\n<< /Length 53 >>\nstream\nBT\n/F1 24 Tf\n100 700 Td\n(Dummy Certificate) Tj\nET\nendstream\nendobj\nxref\n0 5\n0000000000 65535 f \n0000000009 00000 n \n0000000058 00000 n \n0000000115 00000 n \n0000000244 00000 n \ntrailer\n<< /Size 5 /Root 1 0 R >>\nstartxref\n348\n%%EOF\n";

$destDir = __DIR__ . '/storage/app/public/certificates';
if(!is_dir($destDir)) {
    @mkdir($destDir, 0777, true);
}
file_put_contents($destDir . '/dummy_certificate.pdf', $pdfContent);
echo "PDF created.\n";

