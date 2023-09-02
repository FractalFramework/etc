<?php
class dbedt{
static $ath=6;
static $no=['pswd','ip'];

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
$ra=db::cols_k($a); $col=$ra[$col-1];
$rt=[$col=>$va];
if(in_array($col,self::$no))$va=alert('forbidden','red');
else $nid=sql::upd($a,$rt,['id'=>$id]);
return $va;}

static function play($p){
[$a,$n]=vals($p,['a','n']);
$r=sql::read('allid',$a,'ra','');//['_limit'=>$n.', 20']
foreach($r as $k=>$v)
	$r[$k]['id']=bj('dbdt|dbedt,read|a='.$a.',id='.$v['id'],$v['id'],'btn');
$h=db::cols_k($a); array_unshift($h,'id');
if(count($r)<20)$ret=build::editable($r,'dbedt,upd2|a='.$a);
else$ret=build::tabler($r,$h);
return div($ret,'','plyt');}

static function read($p){$r=[];
[$a,$id]=vals($p,['a','id']); $bt='';
$ra=db::cols_r($a); if(!$ra)return 'nodb';
if($a && $id)$r=sql::read('all',$a,'a',$id);
if($id)$ret=build::editable($r,'dbedt,upd|a='.$a.',id='.$id);
else $ret=self::play($p+['n'=>'0']);
if($id)$bt=bj('dbdt|dbedt,read|a='.$a.',id='.$id,ico('edit').$a.':'.$id,'btn');
return $bt.$ret;}

static function menu(){$rt=[];
$r=sql::call('show tables','rv');
foreach($r as $k=>$v)$rt[]=bj('dbdt|dbedt,read|a='.$v,$v);
$ret=join('',$rt);
return $ret;}

static function call($p){
[$a,$b]=vals($p,['a','b']);
$ret=self::read($p);
return div(self::menu(),'menu').div($ret,'','dbdt');}

}
?>