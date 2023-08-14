<?php
class contact{

    static function save($p){
        [$a,$b]=vals($p,['a','b']);
        $help=json::call('lang/help');
        $ret=div($help['received'],'frame-green');
        return $ret;
    }

    static function call($p){
        [$a,$b]=vals($p,['a','b']);
        $ret=h3(voc('contact'));
        $ret.=div(input('name','').label('name',voc('name'),'btn'));
        $ret.=div(input('mail','').label('mail',voc('mail'),'btn'));
        $ret.=div(label('msg',voc('message'),'btn'));
        $ret.=div(textarea('msg',''));
        $ret.=bj(voc('send'),'tgmail|blocks,save||name,mail,msg',['class'=>'btsav']);
        $ret.=div('','','tgmail');
        return $ret;
    }

}