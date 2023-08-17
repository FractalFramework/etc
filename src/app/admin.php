<?php
class admin{

    static function read(){
        $r=sql::read('id,slogan,banner,logo','posts','a',['id'=>ses('uid')]);
    }

    static function call($p){
        return 'e';
    }
}