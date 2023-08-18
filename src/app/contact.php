<?php
class contact{

    static function save($p){
        [$a,$b,$c]=vals($p,['name','mail','msg']);
        $x=sql::sav('contact2',[ses('uid'),'1',$a,$b,$c],0);
        if($x)return div(voc('received'),'frame-green');
        else return div(voc('error'),'frame-red');
    }

    static function call($p){
        [$a,$b]=vals($p,['a','b']);
        $ret=h3(voc('contact'));
        $ret.=div(input('name','').label('name',voc('name'),'btn'));
        $ret.=div(input('mail','').label('mail',voc('mail'),'btn'));
        $ret.=div(label('msg',voc('message'),'btn'));
        $ret.=div(textarea('msg',''));
        $ret.=bj(voc('send'),'tgmail|contact,save||name,mail,msg','btsav');
        $ret.=div('','','tgmail');
        return $ret;
    }

}