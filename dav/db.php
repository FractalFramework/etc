<?php
class db{

static function create_cols($r){$ret=''; $end='';
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
elseif($v=='json')$ret.='`'.$k.'` json,';
//elseif($v=='json'){$ret.='`'.$k.'` mediumtext,'."\n"; $end='CHECK ('.$k.' IS NULL OR JSON_VALID('.$k.')),'."\n";}
//elseif($v=='enum')$ret.=''.$k.'` enum ("'.implode('","',$k).'") NOT NULL,';
return $ret.$end;}

static function cleanup($r){
$rz=['USER','CURRENT_CONNECTIONS','TOTAL_CONNECTIONS'];
foreach($r as $k=>$v)
if(in_array($v['column_name']??'',$rz))unset($r[$k]);
elseif(in_array($k,$rz))unset($r[$k]);
return $r;}

static function type_cols($b){
$r=sql::cols($b,3); $rt=[]; $r=self::cleanup($r);
foreach($r as $k=>$v){
	[$nm,$ty,$sz]=vals($v,['column_name','data_type','character_maximum_length']);
	if($ty=='varchar'){if($sz<64)$ty='svar'; elseif($sz>1000)$ty='bvar'; else $ty='var';}
	if($ty=='mediumtext')$ty='text';
	if($ty=='longtext')$ty='long';
	if($ty=='tinytext')$ty='tiny';
	if($ty=='int')$ty='int';
	if($ty=='decimal')$ty='dec';
	if($ty=='bigint')$ty='bint';
	if($ty=='float')$ty='float';
	if($ty=='double')$ty='double';
	if($ty=='json')$ty='json';
	if($ty=='date')$ty='date';
	if($ty=='datetime')$ty='time';
	$rt[$nm]=$ty;}
return $rt;}

static function jsoncolfromattr($b,$c,$k){//add col from json attr k in new col c//attr_colour
sql::qr('ALTER TABLE '.$b.' ADD '.$c.'_'.$k.' VARCHAR(32) AS (JSON_VALUE('.$c.', "$.'.$k.'"));');
sql::qr('CREATE INDEX '.$b.'_'.$c.'_'.$k.'_ix ON '.$b.'('.$c.'_'.$k.');');}

static function modifjsonvar($b,$c,$k,$v,$q=''){//impact colattr
sql::qr('UPDATE '.$b.' SET '.$c.' = JSON_REPLACE('.$c.', "$.'.$k.'", "'.$v.'") '.sql::where($q,$b).';');}

static function trigger($b,$ra){
	if(!sql::ex($b))return;
	$rb=self::type_cols($b); $rnew=[]; $rold=[];
	if(isset($rb['id']))unset($rb['id']); if(isset($rb['up']))unset($rb['up']);
	if($rb){$rnew=array_diff_assoc($ra,$rb); $rold=array_diff_assoc($rb,$ra);}//old
	if($rnew or $rold){echo $b; pr([$rnew,$rold]);
		$bb=sql::backup($b,date('ymdHis')); sql::qr(sql::drop($b));
		$rtwo=array_intersect_assoc($ra,$rb);//common
		//$rak=array_keys($ra); $rav=array_values($ra);
		$rnk=array_keys($rnew); $rnv=array_values($rnew); $nn=count($rnk);
		$rok=array_keys($rold); $rov=array_values($rold); $no=count($rok);
		$na=count($rnew); $nb=count($rold); $ca=array_keys($rtwo); $cb=array_keys($rtwo);
		if($na==$nb)for($i=0;$i<$nn;$i++)if($rnv[$i]==$rov[$i] or $rnv[$i]!='int'){
			$ca[]=$rnk[$i]; $cb[]=$rok[$i];}
		return 'insert into '.$b.'(id,'.implode(',',$ca).',up) select id,'.implode(',',$cb).',up from '.$bb;}}

//['id'=>'int','ib'=>'int','val'=>'var'];
static function create($b,$r,$up=''){if(!auth(6))return;
if(!is_array($r) or !$b)return; reset($r);
if($up=='z')sql::drop($b);
if($up){$sql=self::trigger($b,$r); }
sql::qr('create table if not exists `'.$b.'` (
	`id` int(11) NOT NULL auto_increment,'.self::create_cols($r).'
	`up` timestamp on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB collate utf8mb4_unicode_ci;',0);
if(isset($sql))sql::qr($sql,1);
}

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

    static function call(){
    }
}