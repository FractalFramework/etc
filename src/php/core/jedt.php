<?php
class jedt{

//punctual
static function addnew($a,$v){
$f=json::file($a);
$d=getfile($f);
$r=json_decode($d,true);
//if($r[$k]??'')return alert('really?','red');
$r[]=array_values($v);
$d=json_encode($r);
putfile($f,$d);
return alert('saved','green');}

//editable
static function update($a,$k,$col,$val){
$f=json::file($a);
$d=getfile($f);
$r=json_decode($d,true);
if($col=='k')$r[$k]=$val;
else $r[$k][$col]=$val;
$d=json_encode($r);
//pr($col);
//putfile($f,$d);
}

static function save($p){
$com=array_shift($p);
return jedt::addnew('cnfg/nav',$com,$p);}

static function create(){
$r=['com','bt','ico','auth'];
$ra=array_combine($r,['var','var','var','int']);
$rb=array_combine($r,['com','bt','ico','0']);
$keys=implode(',',walk($r,'unid'));
$ret=bj('navedt|nav,save||'.$keys,icovoc('save'),'btsav');
$ret.=form::call($ra,$rb);
return $ret.div('','','navedt');}

static function modif($p){
$r=json::call('cnfg/nav'); [$ka,$col]=explode('-',key($p)); $val=current($p); $i=0;
foreach($r as $k=>$v){$i++; if($i==$ka)$ka=$k;}
self::update('cnfg/nav',$ka,$col,$val);
return $val;}

static function artype($r){$ty=''; $isrb=''; $isrc=''; $isrd='';
$k=key($r); $v=current($r); $nk=is_numeric($k)?1:0; $isr=is_array($v)?1:0;
if($isr){$kb=key($v); $vb=next($v); $nkb=is_numeric($kb)?1:0; $isrb=is_array($vb)?1:0;}
if($isrb){$kc=key($vb); $vc=next($vb); $nkc=is_numeric($kc)?1:0; $isrc=is_array($vc)?1:0;}
if($isrc){$kd=key($vc); $vd=next($vc); $nkd=is_numeric($kd)?1:0; $isrd=is_array($vd)?1:0;}
if($isrd)$ty=$nkd?'kkkr':'rrrr';
elseif($isrc)$ty=$nkd?'kkr':'rrr';
elseif($isrb)$ty=$nkc?'kkv':'rr';
elseif($isr)$ty=$nkb?'rv':'ra';
else $ty=$nk?'kv':'a';
return $ty;}

static function addrow($p){$ret='';
$a=$p['a']; $r=json::call($a); $r[]=array_pad([],count(current($r)),''); $h=[];
return build::editable($r,'jedt,modif|',$h,1);}

static function edit($p){$ret='';
$a=$p['a']; $r=json::call($a);
$ty=self::artype($r); $h=[];
if($ty=='a' or $ty=='rv')$ret=build::editable($r,'jedt,modif|',$h,1);
else $ret=self::editxt($p);
$bt=bj('jmnu|jedt,editxt|a='.$a,ico('edit').strend($a,'/').'('.$ty.')');
if($ty=='a' or $ty=='rv')$bt.=bj('navedt|jedt,addrow|a='.$a,ico('plus'));
return $bt.div($ret,'','navedt');}

//txt format
static function savext($p){
$f=json::file($p['a']);
putfile($f,$p['inp']);
return alert('saved','green');}

static function editxt($p){
$f=json::file($p['a']);
$d=getfile($f);
$ret=bj('jedt|json,savext|a='.$p['a'].'|inp',icovoc('save'),'btsav');
$ret.=div(textarea('inp',$d,'',24,['class'=>'console']),'area');
return div($ret,'','jedt');}

//menu
static function bt($v){return bj('jmnu|jedt,edit|a='.$v,strend($v,'/'));}

static function itermenu($ka,$r,$rt=[]){
foreach($r as $k=>$v)
if(is_array($v))$rt=self::itermenu($k,$v,$rt);
else $rt[$ka][]=$v;
return $rt;}

static function menu(){
$dr='src/json';
$r=scanfiles($dr); $ra=[]; $rt=[];
foreach($r as $k=>$v){
	$vb=str_replace([$dr.'/','.json'],'',$v);
	[$ka,$kb,$kc]=expl('/',$vb,3);
	if($kc)$ra[$ka][$kb][$kc]=$vb;
	elseif($kb)$ra[$ka][$kb]=$vb;}
$rb=self::itermenu('/',$ra);
foreach($rb as $k=>$v)$rt[]=div($k.' '.join('',walk($v,'jedt::bt')));
return join('',$rt);}

static function call($p){
return div(self::menu(),'menu').div('','','jmnu');}

}
?>