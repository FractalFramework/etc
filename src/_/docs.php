<?php 
class docs{
static $dr='src';
static $db='_prog';
static $db2='_progr';
static $r=[];
static $n=0;
static $ka=1;
static $save=1;
static $rb=[];//counts
static $rc=[];//funcs
static $rd=[];//tree
static $rr=[];//prep
static $doc='_docs/md/';

#doc
static function doc(){$rt=[];
$r=sql::read('page,func,vars','_prog','kkv',[]);
mkdir_r(self::$doc.'res/');
foreach($r as $k=>$v){$ret='';
	$fa=self::$doc.'src/'.$k.'.md';
	//$fb=self::$doc.'res/'.$k.'.md';
	//if(is_file($fa))$da=getfile($fa);
	if(is_file($fa))$d=getfile($fa);
	$ret.='## Overview'.n().n();
	$n=strpos($d,'## Overview');
	if($n!==false)$d=mb_substr($d,13);
	$n=strpos($d,'## Functions');
	if($n!==false)$d=mb_substr($d,0,$n);
	if($d)$d=trim($d);
	if(!$d)echo $d='n/a'; //$da?$da:
	$ret.=$d.n().n();
	$ret.='## Functions'.n().n();
	foreach($v as $ka=>$va){
		$ret.='- '.$ka.'('.$va.')'.n();}
	putfile($fa,$ret);
	$rt[$k]=$ret;}
$ret=''; $f=self::$doc.'readme.md';
foreach($rt as $k=>$v)$ret.='# '.$k.n().n().$v.n();
putfile($f,$ret);
return div($f,'console');}

#descent
static function iter2($ka){$rt=[];
if(isset(self::$rr[$ka])){$r=self::$rr[$ka]; unset(self::$rr[$ka]);} else return 1;
foreach($r as $k=>$v)if($k!=$ka)$rt[$k]=self::iter($k);
return $rt;}

static function see2($p){$rt=[];
$sq=$p?['child'=>$p]:[];
$r=sql::read('parent,child','_progr','kk',$sq);
self::$rr=$r;
foreach($r as $k=>$v)$rt[$k]=self::iter2($k);
return build::tree($rt,2,1);}

#see
static function iter($ka){$rt=[]; if($ka==self::$ka)return 'iterated'; self::$ka=$ka;
if(isset(self::$rr[$ka])){$r=self::$rr[$ka]; unset(self::$rr[$ka]);} else return 1;//
foreach($r as $k=>$v)if($k!=$ka)$rt[$k]=self::iter($k);
return $rt;}

static function see($p){$rt=[];
$sq=$p?['parent'=>$p]:[];
$r=sql::read('child,parent','_progr','kk',$sq,1);
self::$rr=$r;
foreach($r as $k=>$v)$rt[$k]=self::iter($k);
return build::tree($rt,1,1);}

static function vue(){$rm=[]; $rw=[]; $rd=[]; $rn=[];
//$r=sqb('distinct(dir)','_prog','rv',''); $rk=array_flip($r);
//$r=sqb('dir,func','_prog','kk','');
//foreach($r as $k=>$v)foreach($v as $ka=>$va)$rm[$ka]=$rk[$k]; //moodularity_class
$r=sql::read('page,func as nb','_prog','k',['_order'=>'nb desc']); //pr($r);
arsort($r); $rk=array_keys($r); $rk=array_flip($rk);//classes ordered by popularity
$r=sql::read('dir,page,func,uses','_prog','rn','');
foreach($r as $k=>$v){$kb=($v[0]!='/'?$v[1].'::':'').$v[2];
	$rm[$kb]=$rk[$v[1]];//moodularity_class2
	$rw[$kb]=$v[3];}//weight
//pr($rm);
//pr($rw); 
$r=sql::read('parent,child','_progr','kk','');
$ra[]=['Id','Label','timeset','modularity_class']; $i=0; $rd=[];
$rb[]=['Source','Target','Type','Id','Label','Timeset','Weight'];
foreach($r as $k=>$v){$rd[$k]=$i++; foreach($v as $ka=>$va){$rd[$ka]=$i++; $rn[$ka][]=1;}} //id,weight
foreach($rd as $k=>$v)$ra[]=[$v,$k,'',$rm[$k]??''];
foreach($r as $k=>$v){
	foreach($v as $ka=>$va)$rb[]=[$rd[$k],$rd[$ka],'undirected','','','',$rw[$k]??''];} //count($rn[$k]);
$ret=build::csvfile('prog',$ra);
$ret.=build::csvfile('prog_r',$rb);
$ret.=build::tabler($ra).build::tabler($rb);
return $ret;}

#tree
static function save2($r){
sql::trunc(self::$db2); $rt=[];
$rh=['parent','child'];
foreach($r as $k=>$v)foreach($v as $ka=>$va)$rt[]=[$k,$va];
if($rt)foreach($rt as $k=>$v)sql::sav(self::$db2,$v);}

static function unused($r,$rb){$rt=[];
foreach($r as $k=>$v){[$a,$b]=$v; $fa=$a?$a.'::'.$b:$b;//searched
	if(!isset($rb[$fa]))$rt[]=$fa;}
return $rt;}

static function find($d,$fc){
$r=['.','=','{','(',')','[',' ',"\n"];//}
foreach($r as $k=>$v)
	if(strpos($d,$v.$fc.'(')!==false)return true;
return false;}

static function arbo($r){$rt=[];
foreach($r as $k=>$v){[$a,$b,$d]=$v;
	$fa=($a?$a.'::':'').$b;//parent
	foreach($r as $ka=>$va){[$a2,$b2]=$va;
		$fb=($a2?$a2.'::':'').$b2;//child
		$fc=($a2?($a2==$a?'self':$a2).'::':'').$b2;//searched
		$ex=self::find($d,$fc);
		if($ex)$rt[$fa][]=$fb;}}//&& $fb!=$fa//iteratives
return $rt;}

static function mktree($a,$b){$rt=[]; $rb=[]; $rc=[]; $ry=[];
$r=sql::read('dir,page,func,code','_prog','rn',['_order'=>'dir']); //pr($r);
foreach($r as $k=>$v){$a=$v[0]=='/'?'':$v[1]; $b=$v[2];
	$rb[]=[$a,$b,$v[3]];} //pr($rb);
$rt=self::arbo($rb);
//$ru=self::unused($rb,$rt);
if(self::$save)self::save2($rt);
//foreach($rr as $k=>$v)foreach($v as $ka=>$va)
//	if(isset($rt[$ka]))$ry[$k][$ka]=self::iter($ka); pr($ry);
if(self::$save)$ret=self::state($a);
return $ret;}

#prog

//see
static function funcsee($r){$rb=[];$rt=[];//child=>parent
foreach($r as $k=>$v)foreach($v as $ka=>$va)$rb[$k][$va]=1;
self::$rr=$rb;
foreach($rb as $k=>$v)$rt[$k]=self::iter($k);
return $rt;}

//arbo
static function functree($r){$rt=[];//page=>func=>dr/page=>content
foreach($r as $k=>$v)foreach($v as $ka=>$va){$a=strpos($k,'/')?between($k,'/','.'):'';
	$rt[]=[$a,$ka,$va[1]];}
return self::arbo($rt);}

//save
static function save($p,$r){
$db=self::$db;
if(self::$n==0)sql::trunc($db);
self::$n+=1; $rt=[];
if(strpos($p,'/'))[$dr,$p]=split_one('/',$p,1); else [$dr,$p]=['/',$p];
$rh=['dir','page','func','vars','code','uses'];
foreach($r as $k=>$v)$rt[]=array_combine($rh,[$dr,$p,$k,$v[0],$v[1],self::$rb[$k]]); //pr($rt);
if($rt)foreach($rt as $k=>$v)sql::sav('_prog',$v,0);}

static function find_func($d,$fc){
$p=strpos($d,'function '.$fc.'(');
$d=substr($d,$p);
$vars=between($d,'(',')');
$p=str_replace(["'{'","'}'"],['(ac1)','(ac2)'],$d);
$p=strpos($d,'{');
$d=substr($d,$p);
$n=strlen($d); $a=0; $b=0;
for($i=0;$i<$n;$i++){$c=substr($d,$i,1);
if($c=='{')$a+=1; elseif($c=='}')$b+=1; if($a-$b==0)$n=$i;}
$func=substr($d,1,$n-1);
//$func=html_entity_decode($func);
//$func=utf8enc($func);
$func=trim($func);
$p=str_replace(['(ac1)','(ac2)'],["'{'","'}'"],$d);
return [$vars,$func];}

#list
static function funcnt($p,$r){//fonctions contents
//if(self::$n==2)return;
$pg=strto($p,'.'); $rt=[];
$va=self::$r[$p];
foreach($r as $k=>$v){//fc,occurrences
	$kb=strfrom($k,'::');
	$vb=self::find_func($va,$kb);
	self::$rb[$kb]=array_sum($v);
	$rt[$kb]=$vb;}
	//pr($rt);
if(self::$save)self::save($pg,$rt);
return $rt;}

static function funclist($r){$rt=[];
foreach($r as $k=>$v)$rt[$k]=self::funcnt($k,$v);
return $rt;}

#occur
static function count_cases($a,$va){//functions root
$r=['.','=','{','(','[',' ',"\n"]; $n=0;
foreach($r as $k=>$v)$n+=substr_count($va,$v.$a.'(');
return $n;}

static function occurrences($dr,$r){$rt=[];
$a=strpos($dr,'/')?between($dr,'/','.',1).'::':'';
foreach($r as $k=>$v){//0=>func
	foreach(self::$r as $ka=>$va){$n=0; //a/b.php 
		if(!$a)$n=self::count_cases($v,$va);//not class
		if($a)$n+=substr_count($va,$a.$v.'(');
		$kb=between($ka,'/','.',1).'::';
		if($a==$kb)$n+=substr_count($va,'self::'.$v.'(');
		$rt[$a.$v][$ka]=$n;}}//if($n)//if is_related
return $rt;}

static function funcount($r){$rt=[]; //pr($r);
foreach($r as $k=>$v)$rt[$k]=self::occurrences($k,$v);
return $rt;}

#capture
static function analys($d){$r=explode("\n",$d); $rf=[];
foreach($r as $k=>$v){if(strpos($v,'function ')!==false)$rf[]=between($v,'function ','(');}
return $rf;}

static function capture($r,$dr=''){$rt=[];
foreach($r as $k=>$v){
	if(is_array($v))$rt+=self::capture($v,$k.'/');
	elseif(substr($v,-3)!='.js'){$f=$dr.$v;
		if(is_file($f)){$d=getfile($f);
			self::$r[$dr.$v]=str_replace(['<?php','?>'],'',$d);
			//$a=substr($v,0,-4); //$a=strfrom($a,'/');
			$rt[$dr.$v]=self::analys($d);}}}
return $rt;}

#load
static function rapport($r,$p){
return build::tabler($r[$p]??'','',1);}

static function build($p){
[$a,$b]=vals($p,['a','inp']);
$r=scanfiles(self::$dr);
$ra=self::capture($r); $rb=[]; $rc=[]; $rd=[]; $ret=''; //dr/page=>func
$rb=self::funcount($ra); //dr/page=>func=>dr/page=>nb
$rc=self::funclist($rb,0); //page=>func=>content
$rd=self::functree($rc); //pr($rb);
//$re=self::funcsee($rd);
if($b)$ret=self::rapport($rd,$b);
if(self::$save)$ret=self::state($a);
return $ret;}

static function state($d){
$na=sql::read('count(id)','_prog','v','');
$nb=sql::read('count(id)','_progr','v','');
$ret='action:'.$d.', prog:'.$na.', progr:'.$nb;
return div($ret,'frame-blue');}

static function read($p){
[$a,$b]=vals($p,['a','inp']);
if($b)self::$dr=$b; if($b)self::$save=0;
if($a=='tree')$ret=self::mktree($a,$b);
elseif($a=='vue')$ret=self::vue($a);
elseif($a=='see')$ret=self::see($b);
elseif($a=='see2')$ret=self::see2($b);
elseif($a=='doc')$ret=self::doc($b);
else $ret=self::build($p);
return $ret;}

static function menu($p,$o){
$j='fnc|docs,read|';
$ret=input('inp',$p);
$ret.=bj($j.'a=collect|inp','prog','btsav').' ';
$ret.=bj($j.'a=tree|inp','tree','btsav').' ';
$ret.=bj($j.'a=vue|inp','datas','btn').' ';
$ret.=bj($j.'a=see|inp','see','btn').' ';
$ret.=bj($j.'a=see2|inp','see2','btn').' ';
$ret.=bj($j.'a=doc|inp','doc','btn').' ';
return $ret;}

static function call($p){
[$a,$b]=arr($p);
if(!auth(6))self::$save=0;
$bt=self::menu($a,$b);
$ret=self::state($b);
return $bt.div($ret,'','fnc');}
}
?>