<?php
ini_set('display_errors','1');
error_reporting(E_ALL);
//ini_set('default_charset','utf-8');
session_start();
require('src/php/lib.php');
require('cnfg/'.nohttp(host()).'.php');
$g=gets();
$p=posts();
boot::call();
$com=get('com');
[$app,$mth]=expl(',',$com);
$no=blocks::secure($app,$mth);
if(!$no && method_exists($app,$mth))$ret=$app::$mth($p);
if(isset($ret)){
    if(is_array($ret)){
        header('Content-Type: application/json');
        $ret=json_encode($ret,JSON_HEX_TAG);}
    else header('Content-Type: text/html; charset=utf-8');
if(get('_tg')=='popup')$ret=build::popup($ret,$com);
echo $ret;}
?>