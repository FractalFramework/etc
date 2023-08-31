<?php
class edit{

static function save($p){
$a=$p['a']??'';
//if($a!='tracks')return $no;//derogation
$ra=db::cols_k($a);
$rd=walk($ra,'unid');
$rb=vals($p,$rd);
$rt=array_combine($ra,$rb);
$nid=sql::sav($a,$rt);
if($nid)$ret=div(voc('saved'),'frame-green');
else $ret=div(voc('error'),'frame-red');
$tg=$a.'c1,'.$a.'c2,'.$a.'c3';
$ret.=bj($tg.'|edit,read|a='.$a.',b=play,c='.$nid,voc('return'),'btn');
return $ret;}

static function update($p){
[$a,$id]=vals($p,['a','id']);
$ra=db::cols_k($a);
$rd=walk($ra,'unid');
$rb=vals($p,$rd);
$rt=array_combine($ra,$rb);
$nid=sql::upd($a,$rt,$id);
if($nid)$ret=div(voc('saved'),'frame-green');
else $ret=div(voc('error'),'frame-red');
$tg=$a.'c1,'.$a.'c2,'.$a.'c3';
$ret.=bj($tg.'|edit,read|a='.$a.',b=edit,c='.$id,voc('return'),'btn');
return $ret;}

static function create($p){$r=[];
[$a,$id]=vals($p,['a','id']);
$ra=db::cols_r($a); if(!$ra)return;
//if($b && $id)$r=sql::read('all',$a,'a',$id,0);
$keys=implode(',',walk(array_keys($ra),'unid'));
$ret=bj($a.'3|edit,save|a='.$a.',id='.$id.'|'.$keys,icovoc('save'),'btsav');
$r['uid']=ses('uid');
$ret.=form::call($ra,$r);
return $ret;}

static function edit($p){$r=[];
[$a,$id]=vals($p,['a','id']);
if(!$id)return 'noid';
$ra=db::cols_r($a); if(!$ra)return;
if($a && $id)$r=sql::read('all',$a,'a',$id);
$keys=implode(',',walk(array_keys($ra),'unid'));
$ret=bj($a.'c3|edit,update|a='.$a.',id='.$id.'|'.$keys,icovoc('update'),'btsav');
$ret.=form::call($ra,$r);
return $ret;}

static function play($p){$r=[];
[$a,$id]=vals($p,['a','id']);
if(!$id)return 'noid';
//$ra=db::cols_k($b);
$r=sql::read('all',$a,'a',$id);
return build::tabler($r);}

static function read($p){$rt=[];
[$a,$b,$c]=vals($p,['a','b','c']);
$pr=['a'=>$a,'id'=>$c]; $rt=['','',''];
$rt[0]=self::menu($a,$b,$c);
if($a && $b!='create')$rt[1]=self::entries($a,$b,$c);
$rt[2]=match($b){
	'play'=>self::play($pr),
	'edit'=>self::edit($pr),
	'create'=>self::create($pr),
	default=>''};
return $rt;}

static function entries($a,$b,$c){$rt=[];
$ra=db::cols_r($a); $q=[];
if(isset($r['uid']))$q=['uid'=>ses('uid')];
elseif(!auth(6))return;
$r=sql::read('id',$a,'rv',$q);
$tg=$a.'c1,'.$a.'c2,'.$a.'c3';
//foreach($r as $k=>$v)$rt[]=bj($tg.'|edit,read|a='.$a.',b='.$b.',c='.$v,$v,active($c,$v));
foreach($r as $k=>$v)$rt[]=bjr($tg,'edit,read',['a'=>$a,'b'=>$b,'c'=>$v],$v,active($c,$v));
$ret=join('',$rt);
return $ret;}

static function menu($a,$b,$c){
$r=['play','edit','create']; $rt=[];
$tg=$a.'c1,'.$a.'c2,'.$a.'c3';
//foreach($r as $k=>$v)$rt[]=bj($tg.'|edit,read|a='.$a.',b='.$v.',c='.$c,$v,active($b,$v));
foreach($r as $k=>$v)$rt[]=bjr($tg,'edit,read',['a'=>$a,'b'=>$v,'c'=>$c],$v,active($b,$v));
return join('',$rt);}

static function list(){$rt=[];
$r=sql::call('show tables','rv');
foreach($r as $k=>$v)$rt[]=bj('edt|edit,call|a='.$v.',b=play,c=',$v);//bh('edit/'.$v,$v);
$ret=join('',$rt);
return $ret.div('','','edt');}

static function call($p){
[$a,$b,$c]=vals($p,['a','b','c']);//table,action,id
[$menu,$entries,$res]=self::read($p);
if(!$a)$menu=self::list();
return h2($a).div($menu,'menu',$a.'c1').div($entries,'menu',$a.'c2').div($res,'',$a.'c3');}

}
?>