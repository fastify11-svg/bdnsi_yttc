<?php
$html = file_get_contents("http://127.0.0.1:8000/");
if (strpos($html, 'footer_top_bg.png') !== false) {
    echo "SUCCESS: footer_top_bg.png found in HTML.\n";
} else {
    echo "ERROR: footer_top_bg.png missing.\n";
}
if (strpos($html, 'bteb.gov.bd') !== false) {
    echo "SUCCESS: bteb.gov.bd links found in HTML.\n";
} else {
    echo "ERROR: bteb.gov.bd missing.\n";
}
if (strpos($html, 'footer-disclaimer') !== false || strpos($html, 'এই ওয়েবসাইটে প্রকাশিত সকল তথ্য') !== false) {
    echo "SUCCESS: Disclaimer found.\n";
} else {
    echo "ERROR: Disclaimer missing.\n";
}
echo "Automated E2E DOM test complete.\n";
