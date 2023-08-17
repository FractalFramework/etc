<?php

class main{

    static function read($d,$g){$rb=[];
        $r=json::call('views/'.$d);
        //$rb=self::index($g);
        $ra=view::vars($r);
        //$ra=['banner','menu','content','footer'];
        foreach($ra as $k=>$v)$rb[$v]=blocks::call(['a'=>$v]+$g);
        $ret=view::com($r,$rb);
        return $ret;
    }

    static function call($g){
        if(cnfg('install'))db::install_all();
        $ret=self::read('index',$g);
        return $ret;
    }

}