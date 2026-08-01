<?php
$path = 'public/storage/config';
if(!is_dir($path)) {
    @mkdir($path, 0777, true);
}
copy('public/images/govt.png', $path.'/header_logo.png');
copy('public/images/govt.png', $path.'/main_logo.png');
copy('public/images/govt.png', $path.'/favicon.png');
