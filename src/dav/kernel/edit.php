<?php
class edit{
static $tg='main';//target

static function save($p){
$b=$p['b']??'';
if($no && $b!='tracks')return $no;//derogation
$ra=db::cols_k($b);
$rd=walk($ra,'unid');
$rb=vals($p,$rd);
$rt=array_combine($ra,$rb);
$nid=sql::sav($b,$rt);
if($nid)$ret=div(voc('saved'),'frame-green');
else $ret=div(voc('error'),'frame-red');
$ret.=bj(self::$tg.'|edit,call|a='.$b.',b=play,c='.$nid,voc('return'),'btn');
return $ret;}

static function update($p){
[$b,$id]=vals($p,['b','id']);
if($no)return $no;
$ra=db::cols_k($b);
$rd=walk($ra,'unid');
$rb=vals($p,$rd);
$rt=array_combine($ra,$rb);
$nid=sql::upd($b,$rt,$id);
if($nid)$ret=div(voc('saved'),'frame-green');
else $ret=div(voc('error'),'frame-red');
$ret.=bj(self::$tg.'|edit,call|a='.$b.',b=play,c='.$id,voc('return'),'btn');
return $ret;}

static function create($p){$r=[];
[$b,$id,$rid]=vals($p,['b','id','rid']);
$ra=db::cols_r($b); if(!$ra)return;
//if($b && $id)$r=sql::read('all',$b,'a',$id,0);
$keys=implode(',',walk(array_keys($ra),'unid'));
$ret=bj($rid.'|edit,save|b='.$b.',id='.$id.'|'.$keys,voc('save'),'btsav');
$r['uid']=ses('uid');
$ret.=form::call($ra,$r);
return $ret;}

static function form($p){$r=[];
[$b,$id,$rid]=vals($p,['b','id','rid']);
$ra=db::cols_r($b); if(!$ra)return;
if($b && $id)$r=sql::read('all',$b,'a',$id,0);
$keys=implode(',',walk(array_keys($ra),'unid'));
$ret=bj($rid.'|edit,update|b='.$b.',id='.$id.'|'.$keys,icovoc('update'),'btsav');
$ret.=form::call($ra,$r);
return $ret;}

static function play($p){$r=[];
[$b,$id]=vals($p,['b','id']);
if(!$id)return er('no');
//$ra=db::cols_k($b);
if($id)$r=sql::read('all',$b,'a',$id);
return build::tabler($r);}

static function list(){$rt=[];
$r=sql::call('show tables','rv');
foreach($r as $k=>$v)$rt[]=bh('edit/'.$v,$v);
$ret=join('',$rt);
return div($ret,'menu');}

static function eligibles($a,$b,$rid){$rt=[];
$r=sql::read('id',$a,'rv',['uid'=>ses('uid')]);
foreach($r as $k=>$v)$rt[]=bj($rid.'|edit,read|a='.$a.',b='.$b.',c='.$v,$v);
$ret=join('',$rt);
return div($ret,'menu');}

static function menu($a,$c,$rid){
$r=['play','edit','create']; $rt=[];
foreach($r as $k=>$v)$rt[]=bj($rid.'|edit,read|a='.$a.',b='.$v.',c='.$c,voc($v));
return div(join('',$rt),'menu');}

static function read($p){//pr($p);
[$a,$b,$c]=vals($p,['a','b','c']); $rid=unid($a);
$pr=['b'=>$a,'id'=>$c,'rid'=>$rid];
if($b=='play' && $c)$ret=self::play($pr);
elseif($b=='edit' && $c)$ret=self::form($pr);
elseif($b=='create')$ret=self::create($pr);
elseif($a)$ret=self::eligibles($a,$b,$rid);
else $ret=self::list();
return $ret;}

static function call($p){//pr($p);
[$a,$b,$c]=vals($p,['a','b','c']); $rid=unid($a);
$bt=h2($a).self::menu($a,$c,$rid);
$ret=self::read($p);
return $bt.div($ret,'',$rid);}

}
?>