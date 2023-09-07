<?php 
class download{

static function gz($f){
header('Content-Type: application/x-bzip');
header('Content-Disposition: attachment; filename='.$f);
echo bzcompress($f);}

static function file($f,$nmf){
header('Content-type: application/octet-stream' );
header('Content-Disposition: attachment; filename='.$nmf);
flush();//send buffer
readfile($f);}

static function eye($f){
$r=['file'=>$f,'date'=>day(),'ip'=>hostname()]; 
jedt::add('','usr/downloads',$r);}

static function rednm($d){
if(strrpos($d,'/')!==false)$d=substr($d,strrpos($d,'/')+1);
return str::normalize($d);}

static function call($p){
[$a,$b]=vals($p,['a','b']);
$dir='_datas/dl/'; $f=base64_decode($a);
if(strpos($f,'cnfg')===false && is_file($f)){
	$nm=self::rednm($f); $nmf=$nm.'.txt';
	if(is_file($dir.$nmf))$nb=getfile($dir.$nmf);
	putfile($dir.$nmf,$nb=$nb?$nb+1:1);
	self::eye($f);
	self::file($f,$nm);}}
}
?>