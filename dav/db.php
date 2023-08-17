<?php
class db{

    static function db($b){
        $r=json::call('cnfg/db');
        return $r[$b]??[];
    }

    static function install($b){
        sql::create($b,self::db($b),0);
    }

    static function install_all($b){
        $r=json::call('cnfg/db');
        foreach($r as $k=>$v)
            sql::create($r,$v,1);
    }

    static function call(){
    }
}