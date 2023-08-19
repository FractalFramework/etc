<?php
class json{
static $json_location='public/json/';

static function file($a){
return self::$json_location.$a.'.json';}

static function error(){
return match(json_last_error()){
JSON_ERROR_NONE=>0,
JSON_ERROR_DEPTH=>1,//'Profondeur maximale atteinte'
JSON_ERROR_STATE_MISMATCH=>2,//'Inadéquation des modes ou underflow'
JSON_ERROR_CTRL_CHAR=>3,//'Erreur lors du contrôle des caractères'
JSON_ERROR_SYNTAX=>4,//'Erreur de syntaxe ; JSON malformé'
JSON_ERROR_UTF8=>5,//'Caractères UTF-8 malformés, erreur encodage'
default=>6};}//'Erreur inconnue'

static function er($r,$a=''){
$e=self::error(); if(!$e)return;
if($r)return json_encode(array_combine(array_keys($r),array_fill(0,count($r),$e)));
else return 'error in: '.self::file($a);}

static function build($r){
$rt=json_encode($r,JSON_HEX_TAG);
if($e=self::er($r))echo $e;
return $rt;}

static function call($a){$r=[];
$f=self::file($a);
if(is_file($f)){
	$d=file_get_contents($f);
	$r=json_decode($d,true);
	if($e=self::er($r,$a))echo $e;}
else er('not loaded: '.$f);
return $r;}
}
?>