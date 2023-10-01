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
$ret=main::call($g);
$ret.=tag('div',['id'=>'popup'],'').n();
if(ses('dev'))echo div(rdiv(ses::$er),'small').n();
echo head::page($ret,'fr');
?>