<?php
class css{
static $json_files='css/';
static $css_location='public/css/';

static function file($a){
return self::$css_location.$a.'.css';}

static function trigger($a){
$f=self::file($a); $fb=json::file(self::$json_files.$a);
$d1=ftime($f); $d2=ftime($fb); //pr([$d1,$d2]);
if($d2>$d1)return $f;}

static function save($a,$d){
if($f=self::trigger($a)){file_put_contents($f,$d); ses::er('saved: '.$f);}}

static function read($r){$rt=[];
foreach($r as $k=>$v)$rt[]=$k.'{'.implode_k($v,':','; ').'}';
return implode(n(),$rt);}

static function build($a){
$o=ses::cnfg('savecss');
$f=self::file($a); $d='';
if(!is_file($f) or $o){
	$r=json::call(self::$json_files.$a);
	if($r)$d=self::read($r);
	if($d)self::save($a,$d);}}
}