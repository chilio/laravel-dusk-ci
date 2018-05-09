<?php
require_once('chromedriver-compatibility-matrix.php');
$green= "\033[0;32m";
$yellow="\033[1;33m";
$red="\033[1;31m";
$nocolor="\033[0m";
$system_chrome = $argv[1];
$system_chromedriver = $argv[2];
$laravel_chromediver = $argv[3];
$print_info_only = $argv[4];

$compatible = FALSE;
if ($system_chromedriver == $laravel_chromediver) {
    $compatible = TRUE;
} else {
    foreach ($compatibilityMatrix as $compatPair) {
        if ($compatPair[0] == $laravel_chromediver && $compatPair[1] == $system_chrome){
            $compatible = TRUE;
            break;
        }
    }
}
if ($print_info_only) {
if ($compatible) {
    print $green."Chromedriver check OK.".PHP_EOL;
} else {
    print $red."Chromedriver shipped with your Laravel installation is NOT compatible with this systems chrome version!".PHP_EOL;
    print $green."Don't worry, we are fixing this right now, so you will be able, to test your app anyway.".$nocolor.PHP_EOL;
    print $yellow."You can always read more about running tests with system inbuilt chromedriver in laravel-dusk-ci docs.".$nocolor.PHP_EOL;
}
print $nocolor;
} else {
    print ($compatible?"OK":"INCOMPATIBLE");
}