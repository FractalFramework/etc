<?php
class view{
static $json_views='views/';
static $templates_location='templates/';

static function file($a){
return self::$templates_location.$a.'.html';}

static function vars($r){static $rv=[];
foreach($r as $k=>$v)
	if(is_array($v[2]))self::vars($v[2]);
	elseif(substr($v[2],0,1)=='{'){//todo: multiples vars
		$rv[]=substr($v[2],1,-1);}
return $rv;}

static function save($a,$d){
	$f=self::file($a);
	mkdir_r($f);
    file_put_contents($f,$d);}

static function save_empty($a){
    $r=json::call(self::$json_views.$a); $d='';
    if($r)$d=self::build($r,[],[]);
    self::save($a,$d);}

static function build($r,$ra,$rc){$ret='';
foreach($r as $k=>$v){[$c,$p,$d]=$v;
	if(is_array($d))$d=self::build($d,$ra,$rc);
	else $d=str_replace($rc,$ra,$d);
	if($p)foreach($p as $ka=>$va)
		$p[$ka]=str_replace($rc,$ra,$va);
	$ret.=tag($c,$p,$d)."\n";}
return $ret;}

static function com($r,$ra){$rc=[]; $ret='';
if($ra)foreach($ra as $k=>$v)$rc[$k]='{'.$k.'}';
if($r)$ret=self::build($r,$ra,$rc);
return $ret;}

static function call($a,$ra,$o=''){
$r=json::call(self::$json_views.$a); $ret='';
if($r)$ret=self::com($r,$ra);
if($o or ses::cnfg('savehtml'))self::save_empty($a);
return $ret;}
}