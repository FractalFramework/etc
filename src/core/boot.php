<?php
class boot{
    
    static function cnfg(){
        $r=json::call('cnfg/vars');
        ses('dev',$r['dev']);
        ses::$r['cnfg']=$r;
        //cnfg('db');
    }

    static function call(){
        login::recognize();
        self::cnfg();
    }
}