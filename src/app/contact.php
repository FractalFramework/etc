<?php
class contact{

    static function save($p){
        [$a,$b,$c]=vals($p,['name','mail','msg']); $ex='';
        if($a && $b && $c)$ex=sql::sav('contact2',[ses('uid'),'1',$a,$b,$c],0);
        if($ex)return div(voc('received'),'frame-green');
        else return div(voc('error'),'frame-red');
    }

    static function read($p){
        [$a,$b,$c]=vals($p,['a','b','c']);
        $r=sql::read('name,msg,mail,date_format(up,"%d/%m/%Y") as up','contact2','ra',['_order'=>'up desc']);
        return tabler($r,['from','txt','mail','date']);
    }

    static function call($p){
        [$a,$b]=vals($p,['a','b']);
        $bt=h3(voc('contact'));
        $ret=div(input('name','').label('name',voc('name'),'btn'));
        $ret.=div(input('mail','').label('mail',voc('mail'),'btn'));
        $ret.=div(label('msg',voc('message'),'btn'));
        $ret.=div(textarea('msg',''));
        $ret.=bj(voc('send'),'tgmail|contact,save||name,mail,msg','btsav');
        return $bt.div($ret,'','tgmail');
    }

}