<?php
class contact{

static function save($p){
[$a,$b,$c]=vals($p,['name','mail','msg']); $ex='';
if($a && $b && $c)$ex=sql::sav('contact2',[ses('uid'),'1',$a,$b,$c],0);
if($ex)return alert('received','green');
else return alert('error','red');}

static function read($p){$ret='';
[$a,$b,$c]=vals($p,['a','b','c']);
$r=sql::read('name,msg as txt,mail,date_format(up,"%d/%m/%Y") as date','contact2','ra',['_order'=>'up desc']);
//return build::tabler($r,['from','txt','mail','date']);
foreach($r as $k=>$v){$v['pub']='';
$ret.=view::call('blocks/track',$v);}
return $ret;}

static function call($p){
[$a,$b]=vals($p,['a','b']);
$bt=h3(voc('contact_bt'));
$ret=bj('main|contact,save||name,mail,msg',icovoc('send'),'btsav');
$ret.=div(input('name','',44).label('name',voc('name_bt')));
$ret.=div(input('mail','',44).label('mail',voc('mail_bt')));
$ret.=div(label('msg',voc('message')));
$ret.=div(textarea('msg','','',12),'area');
return $bt.div($ret,'','tgmail');}
}
?>