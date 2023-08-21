<?php
class edit{

static function save($p){
$b=$p['b']??'';
$no=secur::call(__CLASS__,__FUNCTION__);
if($no && $b!='tracks')return $no;//derogation
$ra=db::cols_k($b);
$rd=walk($ra,'unid');
$rb=vals($p,$rd);
$rt=array_combine($ra,$rb);
$nid=sql::sav($b,$rt);
if($nid)$ret=div(voc('saved'),'frame-green');
else $ret=div(voc('error'),'frame-red');
$ret.=bj(voc('return'),'content|edit,call|a='.$b.',b=read,c='.$nid,'btn');
return $ret;}

static function update($p){
[$b,$id]=vals($p,['b','id']); 
$no=secur::call(__CLASS__,__FUNCTION__);
if($no)return $no;
$ra=db::cols_k($b);
$rd=walk($ra,'unid');
$rb=vals($p,$rd);
$rt=array_combine($ra,$rb);
$nid=sql::upd($b,$rt,$id);
if($nid)$ret=div(voc('saved'),'frame-green');
else $ret=div(voc('error'),'frame-red');
$ret.=bj(voc('return'),'content|edit,call|a='.$b.',b=read,c='.$id,'btn');
return $ret;}

static function create($p){$r=[];
[$b,$id,$rid]=vals($p,['b','id','rid']);
$ra=db::cols_r($b); if(!$ra)return;
//if($b && $id)$r=sql::read('all',$b,'a',$id,0);
$keys=implode(',',walk(array_keys($ra),'unid'));
$ret=bj(voc('save'),$rid.'|edit,save|b='.$b.',id='.$id.'|'.$keys,'btsav');
$ret.=form::call($ra,$r);
return $ret;}

static function form($p){$r=[];
[$b,$id,$rid]=vals($p,['b','id','rid']);
$ra=db::cols_r($b); if(!$ra)return;
if($b && $id)$r=sql::read('all',$b,'a',$id,0);
$keys=implode(',',walk(array_keys($ra),'unid'));
$ret=bj(voc('update'),$rid.'|edit,update|b='.$b.',id='.$id.'|'.$keys,'btsav');
$ret.=form::call($ra,$r);
return $ret;}

static function read($p){$r=[];
[$b,$id]=vals($p,['b','id']);
if(!$id)return er('no');
//$ra=db::cols_k($b);
if($id)$r=sql::read('all',$b,'a',$id); //pr($r);
return tabler($r);}

static function lk($d){
return bh($d,'edit/'.$d);}

static function list(){$rt=[];
$r=sql::call('show tables','rv');
$rt=walk($r,'edit::lk');
$ret=join('',$rt);
return div($ret,'menu');}

static function menu($a,$c){
$r=['read','edit','create']; $rt=[];
foreach($r as $k=>$v)$rt[]=bh(voc($v),'edit/'.$a.'/'.$v.'/'.$c); 
return div(join('',$rt),'menu');}

static function call($p){//pr($p);
[$a,$b,$c]=vals($p,['a','b','c']); $rid=rid($a);
$pr=['b'=>$a,'id'=>$c,'rid'=>$rid];
if($b=='read' && $c)$ret=self::read($pr);
elseif($b=='edit' && $c)$ret=self::form($pr);
elseif($b=='create')$ret=self::create($pr);
else $ret=self::list();
$bt=self::menu($a,$c);
return $bt.div($ret,'',$rid);}

}