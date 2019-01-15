<?php
$compatibility = [
    '2.45' => '70-72',
    '2.44' => '69-71',
    '2.43' => '69-71',
    '2.42' => '68-70',
    '2.41' => '67-69',
    '2.40' => '66-68',
    '2.39' => '66-68',
    '2.38' => '65-67',
    '2.37' => '64-66',
    '2.36' => '63-65',
    '2.35' => '62-64',
    '2.34' => '61-63',
    '2.33' => '60-62'
];
$compatibilityMatrix = [];
foreach ($compatibility as $driver => $chrome) {
    $chromeversions_temp = explode('-',$chrome);
    if (count($chromeversions_temp)>1) {
        $beginning = $chromeversions_temp[0];
        $end = $chromeversions_temp[1];
    } else {
        $beginning = $chrome;
        $end = $chrome;
    }
    for ($i=$beginning; $i<=$end ; $i++){
        array_push($compatibilityMatrix, [$driver, intval($i)]);
    }
}
