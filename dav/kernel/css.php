<?php
class css{

static function file($a){
return 'public/css/'.$a.'.css';}

static function save($a,$d){
$f=self::file($a);
file_put_contents($f,$d);
ses::er('saved: '.$f);}

static function read($r){$rt=[];
foreach($r as $k=>$v)$rt[]=$k.'{'.implode_k($v,':','; ').'}';
return implode(n(),$rt);}

static function build($a){
$o=ses::cnfg('savecss');
$f=self::file($a); $d='';
if(!is_file($f) or $o){
	$r=json::call('cnfg/'.$a);
	if($r)$d=self::read($r);
	if($d)self::save($a,$d);}}
}