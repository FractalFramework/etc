<?php
class db{

static function jsoncolfromattr($b,$c,$k){//add col from json attr k in new col c//attr_colour
sql::qr('alter table '.$b.' add '.$c.'_'.$k.' varchar(32) as (json_value('.$c.', "$.'.$k.'"));');
sql::qr('create index '.$b.'_'.$c.'_'.$k.'_ix on '.$b.'('.$c.'_'.$k.');');}

static function modifjsonvar($b,$c,$k,$v,$q=''){//impact colattr
sql::qr('update '.$b.' set '.$c.' = json_replace('.$c.', "$.'.$k.'", "'.$v.'") '.sql::mkq($q,$b).';');}

static function createcols($r){$ret=''; $end='';
//$collate='collate utf8mb4_uniocode_ci'; $set='CHARACTER SET utf8mb4';
foreach($r as $k=>$v)
if($v=='int')$ret.='`'.$k.'` int(11) default NULL,'."\n";
elseif($v=='bint')$ret.='`'.$k.'` bigint(36) NULL default NULL,'."\n";
elseif($v=='dec')$ret.='`'.$k.'` decimal(20,20) NULL default NULL,'."\n";
elseif($v=='float')$ret.='`'.$k.'` float(20,2) NULL default NULL,'."\n";
elseif($v=='double')$ret.='`'.$k.'` double NULL default NULL,'."\n";
elseif($v=='var')$ret.='`'.$k.'` varchar(255) NOT NULL default "",';
elseif($v=='bvar')$ret.='`'.$k.'` varchar(1020) NOT NULL default "",';
elseif($v=='svar')$ret.='`'.$k.'` varchar(60) NOT NULL default "",';
elseif($v=='tiny')$ret.='`'.$k.'` tinytext,';
elseif($v=='text')$ret.='`'.$k.'` mediumtext,';//'.$set.'
elseif($v=='long')$ret.='`'.$k.'` longtext,';
elseif($v=='date')$ret.='`'.$k.'` date NOT NULL,';
elseif($v=='time')$ret.='`'.$k.'` datetime NOT NULL,';
//elseif($v=='json')$ret.='`'.$k.'` json,';
elseif($v=='json')$ret.='`'.$k.'` mediumtext,';
//elseif($v=='json'){$ret.='`'.$k.'` mediumtext,'."\n"; $end='CHECK ('.$k.' is null or json_valid('.$k.')),'."\n";}
//elseif($v=='enum')$ret.=''.$k.'` enum ("'.implode('","',$k).'") NOT NULL,';
return $ret.$end;}

static function cleanup($r){
$rz=['USER','CURRENT_CONNECTIONS','TOTAL_CONNECTIONS'];
foreach($r as $k=>$v)
if(in_array($v['column_name']??'',$rz))unset($r[$k]);
elseif(in_array($k,$rz))unset($r[$k]);
return $r;}

static function realdbname($b){return cnfg('db').'.'.$b;}

static function readcols($b,$n=''){if($n)$b=self::realdbname($b);
$sql='select column_name,data_type,character_maximum_length from information_schema.columns where table_name="'.$b.'"';
return sql::call($sql,'ra');}

static function colstype($b){
$r=self::readcols($b,1); $rt=[]; $r=self::cleanup($r);
foreach($r as $k=>$v){['column_name'=>$nm,'data_type'=>$ty,'character_maximum_length'=>$sz]=$v;
	$ty=match($ty){
	'varchar'=>$sz<64?'svar':($sz>1000?'bvar':'var'),
	//'int'=>'int',
	'bigint'=>'bint',
	'decimal'=>'dec',
	//'float'=>'float',
	//'double'=>'double',
	//'json'=>'json',
	'json'=>'text',
	'mediumtext'=>'text',
	'longtext'=>'long',
	'tinytext'=>'tiny',
	//'date'=>'date',
	'datetime'=>'time',
	default=>$ty};
$rt[$nm]=$ty;}
return $rt;}

static function trigger($b,$ra){
if(!sql::ex($b))return;
$rb=self::colstype($b); $rnew=[]; $rold=[];
if(isset($rb['id']))unset($rb['id']); if(isset($rb['up']))unset($rb['up']);
if($rb){$rnew=array_diff_assoc($ra,$rb); $rold=array_diff_assoc($rb,$ra);}//old
if($rnew or $rold){echo $b; pr([$rnew,$rold]);
	$bb=sql::backup($b,date('ymdHis')); sql::drop($b);
	$rtwo=array_intersect_assoc($ra,$rb);//common
	//$rak=array_keys($ra); $rav=array_values($ra);
	$rnk=array_keys($rnew); $rnv=array_values($rnew); $nn=count($rnk);
	$rok=array_keys($rold); $rov=array_values($rold); $no=count($rok);
	$na=count($rnew); $nb=count($rold); $ca=array_keys($rtwo); $cb=array_keys($rtwo);
	if($na==$nb)for($i=0;$i<$nn;$i++)if($rnv[$i]==$rov[$i] or $rnv[$i]!='int'){
		$ca[]=$rnk[$i]; $cb[]=$rok[$i];}
	return 'insert into '.$b.'(id,'.implode(',',$ca).',up) select id,'.implode(',',$cb).',up from '.$bb;}}

//['id'=>'int','val'=>'var']
static function create($b,$r,$up=''){
if(!auth(6) && !cnfg('dev'))return;
if(!is_array($r) or !$b)return; reset($r);
if($up=='z')sql::drop($b);
if($up){$sql=self::trigger($b,$r); }
sql::qr('create table if not exists `'.$b.'` (
	`id` int(11) NOT NULL auto_increment,'.self::createcols($r).'
	`up` timestamp on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB collate utf8mb4_unicode_ci;',0);
//if($b=='users' && $r['name']??'')sql::unikey($b,'name');
if(isset($sql))sql::qr($sql,1);}

static function table($b){
$r=json::call('cnfg/db');
return $r[$b]??[];}

static function cols_r($b){
$r=sesmk('db::table',$b);
return $r;}

static function cols_k($b){
$r=self::cols_r($b);
return array_keys($r);}

static function cols_s($b){
$r=self::cols_k($b);
return join(',',$r);}

static function install($b,$z=0){
self::create($b,self::table($b),$z);}

static function install_all(){
$r=json::call('cnfg/db');
foreach($r as $k=>$v)
	self::create($k,$v,1);}

static function call(){}
}

?>
