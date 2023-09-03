<?php
class blocks{//called funcs for $main content
static $defaults=['surname'=>'etc','slogan'=>'...','banner'=>'','logo'=>''];

static function bkg(){
$id=ses('uid'); if(!$id)$id=cnfg('usrhome');
$v=sql::read('banner','profile2','v',$id);
if(isimg($v??''))$v='url(/img/'.$v.')';
return $v;}

static function banner($p){
[$a,$b]=vals($p,['a','b']);
$id=ses('uid'); if(!$id)$id=cnfg('usrhome');
$r=sql::read('surname,slogan,banner,logo','profile2','a',$id);
if(!$r)$r=self::$defaults;
$r['surname']=bh('home',$r['surname']);
$ret=view::call('blocks/banner',$r);
return $ret;}

static function footer($p){
$bt=lk('/','𝓮𝓽𝓬').' | ';
$bt.=lk('https://github.com/FractalFramework/etc','src','small');
$ret=div($bt);
$ret.=div('@2023 All rights reserved','small');
return $ret;}

static function shutter($p){return;
if(get('a')=='post' && is_numeric($p['a']??''))
return div(tracks::call($p),'main');}

static function home($p){
$r['presentation']=conns::profile('');
$r['socials']=conns::socials('');
$ret=view::call('blocks/home',$r);
return $ret;}

static function forbidden(){
return alert('forbiden_access','red');}

static function secure($a,$b){
$r=sesmk('json::call','cnfg/secur');
$m=$r[$a][$b]??ses('auth');
if(!auth($m))return 1;}

static function call($p){
[$a,$b,$c,$d]=vals($p,['a','b','c','d']);
if($a=='main')$a=get('a');//root for $main is decided by url
if($a=='main')$a='';//discard loop
$p=['a'=>$b,'b'=>$c,'c'=>$d];//like ajax cmd
if(method_exists('blocks',$a)){
	if(self::secure('blocks',$a))return self::forbidden();
	else return self::$a($p);}
if(method_exists($a,'call')){
	if(self::secure($a,'call'))return self::forbidden();
	else return $a::call($p);}
return match($a){//specific urls to avoid {url}::call
	'create'=>auth(4)?posts::create($p):self::forbidden(),
	//'addnav'=>auth(4)?nav::create($p):self::forbidden(),
	//'edit'=>auth(4)?posts::read($p):self::forbidden(),
	'user'=>admin::user($p),
	default=>posts::call($p)};}
}
?>