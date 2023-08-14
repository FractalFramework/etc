<?php

class module{    
    
    //expected variables from template index
    static function index($g){
        $p=vals($g,['b','c']);//join ajax cmd
        $r=['banner','menu','content','footer'];//todo: detect vars
        foreach($r as $k=>$v)$r[$v]=blocks::call(['a'=>$v]+$p);//$a is replaced by fcn
        return $r;
    }

    static function call(){
        $g=ses::$r['get'];
        $ra=json::call('views/index');
        $rb=self::index($g);
        $ret=view::com($ra,$rb);
        return $ret;
    }

}