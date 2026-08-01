<?php
$css1 = @file_get_contents('https://bteb.gov.bd/site-assets/css/index.css');
$css2 = @file_get_contents('https://bteb.gov.bd/widget-assets/css/FooterWidget');
file_put_contents('bteb_css.txt', "--- index.css ---\n" . $css1 . "\n--- FooterWidget ---\n" . $css2);
