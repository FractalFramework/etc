<?php

class main{    
    
    //expected variables from template index
    static function index($g){
        $r=['banner','menu','content','footer'];//todo: detect vars
        foreach($r as $k=>$v)$r[$v]=blocks::call(['a'=>$v]+$g);
        return $r;
    }

    static function call($g){
        $ra=json::call('views/index');
        $rb=self::index($g);
        $ret=view::com($ra,$rb);
        return $ret;
    }

}