<?php
class login{
static $default_ban='IC1396,Hubble5-cropped-lrg.jpg';
static $maintg='main';
static $er='';

static function hash($d){return password_hash($d,PASSWORD_DEFAULT);}
static function vrfpsw($d,$hash){return password_verify($d,$hash);}

static function alex($a){
return sql::read('id','users','v',['name'=>$a]);}

static function fastsave($p){
[$a,$b,$c]=vals($p,['name','mail','pswd']);
$ex=self::alex($a); $uid='';
if($ex)self::$er='already_exists';
else $uid=sql::sav('users',[$a,1,$b,self::hash($c)]);
if($uid)self::auth($uid);
return $uid;}

static function register($p){$ok='';
[$a,$b,$c]=vals($p,['name','mail','pswd']);
$ex=self::firstuser(); $auth=$ex?1:6; $psw=self::hash($c);
$ex=self::alex($a);
if($a && $b && $c && !$ex)$ok=sql::sav('users',[$a,$auth,$b,$psw]);
if($ok)$ak=sql::sav('profile2',[$ok,$a,'here',self::$default_ban,'']);
if($ok)self::auth($ok);
if($ok)$ret=div(voc('registered'),'frame-blue');
else $ret=div(voc('notregistered'),'frame-red');
return [$ret,blocks::nav([])];}

static function firstuser(){
return sql::read('id','users','v',1);}

static function form($p){
[$a,$b]=vals($p,['a','b']);
$ret=h3(voc('login'));
if(!self::firstuser())$ret.=div(voc('first_user'),'frame-white');
$ret.=bj(self::$maintg.',nav|login,call||name,pswd',voc('go'),'btsav');
$ret.=div(input('name','').label('name',voc('knowname'),'btn'));
$ret.=div(inpsw('pswd','').label('pswd',voc('password'),'btn'));
return $ret;}

static function response($p){
[$a,$b]=vals($p,['name','pswd']);
$uid=sql::read('id','users','v',['name'=>$a]);
$psw=sql::read('pswd','users','v',['id'=>$uid]);
$ok=self::vrfpsw($b,$psw);
if($ok){self::auth($uid); $ret=div(voc('loged').', '.$a,'frame-green');}
elseif($uid){
	$ret=div(voc('bad_password'),'frame-blue');
	$ret.=div(bh('login',voc('redo'),'btn'));
	$ret.=hidden('name',$a);
	$ret.=div(inpsw('pswd',$b).label('pswd',voc('password'),'btn'));
	$ret.=bj(self::$maintg.',nav|login,call||name,pswd',voc('go'),'btsav');}
else{
	$ret=div(voc('inexistant_user'),'frame-red');
	$ret.=div(bh('login',voc('go'),'btn'));
	$ret.=hidden('name',$a).hidden('pswd',$b);
	$ret.=div(inpmail('mail','').label('mail',voc('knownmail'),'btn'));
	$ret.=bj(self::$maintg.',nav|login,register||name,mail,pswd',voc('register?'),'btsav');
	$ret.=div('','','tgreg');}
return [$ret,blocks::nav([])];}

static function auth($id=''){
if(!$id)$id=1;//assume first user
//$r=sql::read('id,name,auth','users','a',$id);
$r=sql::inner('b1.id,uid,b1.name,auth,slogan,logo','users','profile2','uid','a',['b1.id'=>$id]);
if(!$r)return;
ses('uid',$r['id']);
ses('usr',$r['name']);
ses('auth',$r['auth']); //auth(6);
ses::$r['usr']=$r; //ses::usr('name');
cookie('uid',$r['id']);}

static function recognize(){//called from boot
$uid=cookie('uid');
if($uid && !ses('uid'))self::auth($uid);}

static function logout(){
sesz('usr');
sesz('uid');
sesz('auth');
//cookie('uid',0);
setcookie('uid','',0);
$d=div(voc('loged_out'),'frame-white');
return [$d,blocks::nav([])];}

static function loged(){
$ret=div(voc('hello').' '.ses('usr'),'frame-blue');
$ret.=div(bj(self::$maintg.',nav|login,logout',voc('logout'),'btn'));
return $ret;}

static function call($p){
[$a,$b]=vals($p,['name','pswd']);
if(ses('uid'))$ret=self::loged();
elseif($a && $b)$ret=self::response($p);
else $ret=self::form($p);
return $ret;}
}
?>