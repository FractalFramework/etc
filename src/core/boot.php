<?php
class boot{
    
static function cnfg(){
$r=json::call('cnfg/vars');
ses('dev',$r['dev']);
ses::$r['cnfg']=$r;}//cnfg('db');

static function call(){
self::cnfg();
//build::ftpchmod('src',777);
login::recognize();
if(cnfg('install'))db::install_all();
}
}
?>