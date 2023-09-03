<?php
class dbedt{
static $no=['id','uid','pswd','ip','up'];

static function upd2($p){
$a=array_shift($p); $ka=key($p);
[$row,$col]=explode('-',$ka); $va=current($p);
$r=sql::read('id',$a,'rv',''); $id=$r[$row-1];
if(in_array($col,self::$no))$va=alert('forbidden','red');
else $nid=sql::upd($a,[$col=>$va],['id'=>$id]);
return $va;}

static function upd($p){
$a=array_shift($p); $id=array_shift($p); $ka=key($p);
[$row,$col]=explode('-',$ka); $va=current($p);
if($col='v')$col=$row;//2d array
$ra=db::cols_k($a);
if(in_array('uid',$ra)){$ko=in_array_k('uid',$ra); unset($ra[$ko]); $ra=array_values($ra);}//not edit uid
$col=$ra[$col-1];
$rt=[$col=>$va];
if(in_array($col,self::$no))$va=alert('forbidden','red');
else $nid=sql::upd($a,$rt,['id'=>$id]);
return $va;}

static function play($p){
[$a,$n]=vals($p,['a','n']);
$r=sql::read('allid',$a,'ra',''); $rb=$r;//['_limit'=>$n.', 20']
foreach($r as $k=>$v)
	$rb[$k]['id']=bj('dbdt|dbedt,read|a='.$a.',id='.$v['id'],$v['id'],'btn');
$h=db::cols_k($a); $hb=$h; array_unshift($h,'id'); array_unshift($h,'_');
if(count($r)<20)$ret=build::editable($rb,'dbedt,upd2|a='.$a,$h);
else$ret=build::tabler($r,$hb);
return div($ret,'','plyt');}

static function read($p){$r=[];
[$a,$id]=vals($p,['a','id']); $bt='';
$ra=db::cols_r($a); if(!$ra)return 'nodb';
if($a && $id)$r=sql::read('all',$a,'a',['id'=>$id]);
if($r['uid']??'')unset($r['uid']);//not edit uid
if($id)$ret=build::editable($r,'dbedt,upd|a='.$a.',id='.$id);
elseif(auth(6))$ret=self::play($p+['n'=>'0']);
if($id)$bt=bj('dbdt|dbedt,read|a='.$a.',id='.$id,ico('edit').$a.':'.$id,'btn');
return $bt.$ret;}

static function menu(){$rt=[];
$r=sql::call('show tables','rv');
foreach($r as $k=>$v)$rt[]=bj('dbdt|dbedt,read|a='.$v,$v);
$ret=join('',$rt);
return $ret;}

static function call($p){
[$a,$id]=vals($p,['a','id']);
$ret=self::read($p);
if(auth(6))$bt=self::menu(); else $bt='';
return div($bt,'menu').div($ret,'','dbdt');}

}
?>