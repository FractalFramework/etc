<?php
$g=gets();
get('a','home');//default app
$g=ses::gets();
boot::call();

css::build('styles');
head::json('cnfg/headers');
head::add('jscode','state='.json_encode($g).';');
echo head::run();

$ret=module::call();

//dev
$ret.=tag('div',['class'=>'popup'],"").n();
if(ses('dev'))echo div(rdiv(ses::$er),'small').n();

echo tagb('body',$ret);
//echo '</html>';