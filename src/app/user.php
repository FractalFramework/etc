<?php
class user{
    static function save(){
        
    }
    static function read(){
        $r=sql::read('id,slogan,banner,logo','posts','a',['id'=>ses('uid')]);
        
    }
    static function call(){
        
    }
}