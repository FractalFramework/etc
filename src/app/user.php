<?php
class user{
    static function save(){
        
    }
    static function read(){
        return edit::call(['a'=>'profile2','b'=>'read','c'=>ses('uid')]);
    }
    static function call(){
        return self::read();
    }
}