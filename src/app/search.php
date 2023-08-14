<?php
class search{

    static function engine($p){$rb=[];
        $inp=$p['inp']??'';
        $r=sql::read('id,title','posts','kv',['%content'=>$inp]);
        foreach($r as $k=>$v)$rb[]=blocks::call('posts',['id'=>$k]);
        if(!$r)$rb[]=div('zero result','frame-red');
        return join($rb);
    }

    static function call($p){
        [$a,$b,$inp]=vals($p,['a','b','inp']);
        $ret=h3(voc('search'));
        $ret.=bj(voc('go'),'tgsearch|blocks,engine||inp',['class'=>'btsav']);
        $ret.=input('inp','markdown');
        $ret.=div('','','tgsearch');
        return $ret;
    }

}