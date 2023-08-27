<?php
class contact{

static function save($p){
[$a,$b,$c]=vals($p,['name','mail','msg']); $ex='';
if($a && $b && $c)$ex=sql::sav('contact2',[ses('uid'),'1',$a,$b,$c],0);
if($ex)return div(voc('received'),'frame-green');
else return div(voc('error'),'frame-red');}

static function read($p){
[$a,$b,$c]=vals($p,['a','b','c']);
$r=sql::read('name,msg,mail,date_format(up,"%d/%m/%Y") as up','contact2','ra',['_order'=>'up desc']);
return build::tabler($r,['from','txt','mail','date']);}

static function call($p){
[$a,$b]=vals($p,['a','b']);
$bt=h3(voc('contact'));
$ret=bj(icovoc('send'),'main|contact,save||name,mail,msg','btsav');
$ret.=div(input('name','',44).label('name',voc('name'),'btn'));
$ret.=div(input('mail','',44).label('mail',voc('mail'),'btn'));
$ret.=div(label('msg',voc('message'),'btn'));
$ret.=div(textarea('msg','','',12),'area');
return $bt.div($ret,'','tgmail');}
}