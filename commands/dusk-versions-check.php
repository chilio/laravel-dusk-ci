<?php
require_once('chromedriver-compatibility-matrix.php');
$green= "\033[0;32m";
$yellow="\033[1;33m";
$red="\033[1;31m";
$nocolor="\033[0m";
$system_chrome = $argv[1];
$system_chromedriver = $argv[2];
$laravel_chromedriver = $argv[3];
$print_info_only = $argv[4];

$compatible = FALSE;
if ($system_chromedriver == $laravel_chromedriver) {
    $compatible = TRUE;
} else {
    foreach ($compatibilityMatrix as $compatPair) {
        if ($compatPair[0] == $laravel_chromedriver && $compatPair[1] == $system_chrome){
            $compatible = TRUE;
            break;
        }
    }
}
if ($print_info_only) {
    if ($compatible) {
        print $green." Laravel Chromedriver check PASSED OK.".PHP_EOL;
        print $yellow."You can use both Chromedriver shipped with Laravel (".$laravel_chromedriver.") or system Chromeriver (".$system_chromedriver.")".PHP_EOL;
        print $yellow."System Chromedriver is NOT automatically started in this case. So, before running php artisan DUSK, you have 2 options:".PHP_EOL;
        print $yellow."1. If you want to run tests with Laravel Chromedriver and you have DuskTestCase.php configured with 'static::startChromeDriver();' enabled, then you don't need to change anything.".PHP_EOL;
        print $yellow."2. If you want to run tests with System Chromedriver, remember to issue command 'chromedriver &' in your .gitlab-ci-yml before starting Dusk tests.".PHP_EOL;
    } else {
        print $red."Chromedriver shipped with your Laravel installation is NOT compatible with current system chrome version!".PHP_EOL;
        print $green."Don't worry, we are fixing this right now, and you will be able, to test your app anyway.".$nocolor.PHP_EOL;
        print $yellow."Read more, about running tests with system inbuilt chromedriver in laravel-dusk-ci docs.".$nocolor.PHP_EOL;
    }
    print $nocolor;
} else {
    print ($compatible?"OK":"INCOMPATIBLE");
}
