<?php
class blocks{

static $defaults=['surname'=>'etc','slogan'=>'...','banner'=>'','logo'=>''];

static function banner($p){
[$a,$b]=vals($p,['a','b']);
$id=ses('uid'); if(!$id)$id=cnfg('usrhome');
$r=sql::read('surname,slogan,banner,logo','profile2','a',$id);
if(!$r)$r=self::$defaults;
if(isimg($r['banner']??''))$r['banner']='url(/img/'.$r['banner'].')';
$ret=view::call('blocks/banner',$r);
return $ret;}

static function footer($p){
$ret=div('etc@2023');
//$ret.=div(lk('https://github.com/FractalFramework/etc','i want the same'),'small');
$ret.=div('Tous droits réservés','small');
return $ret;}

static function shutter($p){}

static function home($p){
$r['presentation']=conns::profile('');
$r['socials']=conns::socials('');
$ret=view::call('blocks/home',$r);
return $ret;}

static function user(){
$rt['profile']=edit::call(['a'=>'profile2','b'=>'play','c'=>ses('uid')]);
$rt['socials']=edit::call(['a'=>'socials','b'=>'play','c'=>'']);
if(auth(6))$rt['all']=edit::call(['a'=>'','b'=>'','c'=>'']);
return build::tabs($rt);}

static function forbidden(){
return div(voc('forbiden_access'),'frame-red');}

static function call($p){
[$a,$b,$c,$d]=vals($p,['a','b','c','d']);
if($a=='main')$a=get('a');//root for main//discard loop
$p=['a'=>$b,'b'=>$c,'c'=>$d];//join ajax cmd
if(method_exists('blocks',$a))return self::$a($p);
if(method_exists($a,'call'))return $a::call($p);
return match($a){
	'post'=>posts::read($p),
	'create'=>auth(4)?posts::create($p):self::forbidden(),
	'addnav'=>auth(4)?nav::create($p):self::forbidden(),
	//'edit'=>auth(4)?posts::read($p):self::forbidden(),
	//'home'=>posts::call(['a'=>'home']),
	default=>posts::call($p)};}
}