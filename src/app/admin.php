<?php
class admin{
    static $db=['name'=>'var','role'=>'int','mail'=>'var','pswd'=>'password','slogan'=>'var','logo'=>'var'];

    static function install($p=''){
        sql::create('admin',self::$db,1);//id,...,day
    }

    static function com($p){
        
    }

    static function call($p){
        self::install(1);
        echo 'e';
    }
}