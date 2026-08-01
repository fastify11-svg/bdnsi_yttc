<?php
$html = file_get_contents('https://bteb.gov.bd/');
$doc = new DOMDocument();
@$doc->loadHTML($html);
$xpath = new DOMXPath($doc);
$footer = $xpath->query('//div[contains(@class, "footer-widget-section")]');
if ($footer->length > 0) {
    file_put_contents('bteb_footer.html', $doc->saveHTML($footer->item(0)));
} else {
    $footer2 = $xpath->query('//footer');
    if ($footer2->length > 0) {
        file_put_contents('bteb_footer.html', $doc->saveHTML($footer2->item(0)));
    } else {
        file_put_contents('bteb_footer.html', 'No footer found');
    }
}
