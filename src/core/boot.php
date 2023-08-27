<?php
class boot{
    
static function cnfg(){
$r=json::call('cnfg/vars');
ses('dev',$r['dev']);
ses::$r['cnfg']=$r;}
//cnfg('db');

static function call(){
self::cnfg();
login::recognize();
//echo ses('auth');
//chmodf('/');
if(cnfg('install'))db::install_all();}
}