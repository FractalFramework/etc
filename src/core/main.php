<?php

//this process is not industrialized
//to do well, it must be automatized
//choosing same names for var and functions 
class main{

    static function read($a,$g){$rb=[];
        $r=json::call('views/'.$a);
        $ra=view::vars($r);
        //$ra=['banner','nav','content','footer'];
        foreach($ra as $k=>$v)$rb[$v]=blocks::call(['a'=>$v]+$g);
        $ret=view::com($r,$rb);
        if(ses::cnfg('savehtml'))view::save_html($a);
        return $ret;
    }

    static function call($g){
        $ret=self::read('index',$g);
        return $ret;
    }

}