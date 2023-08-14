<?php
class view{

static function file($a){
return 'templates/'.$a.'.html';}

static function save($a,$d){
	$f=self::file($a);
	mkdir_r($f);
    file_put_contents($f,$d);}

static function save_empty($a){
    $r=json::call('views/'.$a); $d='';
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
$r=json::call('views/'.$a); $ret='';
if($r)$ret=self::com($r,$ra);
if($o or ses::cnfg('savehtml'))self::save_empty($a);
return $ret;}
}