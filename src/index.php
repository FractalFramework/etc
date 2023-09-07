<?php
$g=gets();
get('a','home');//default app
$g=ses::gets();
boot::call();

css::build('lib');
css::build('core');

head::json('cnfg/head');
head::add('jscode','state='.json_encode($g).';
var maintg="main|blocks,call"');
echo head::run();

$ret=main::call($g);

//dev
$ret.=tag('div',['class'=>'popup'],'').n();
if(ses('dev'))echo div(rdiv(ses::$er),'small').n();

echo tag('body',[],$ret);
//echo '</html>';
?>