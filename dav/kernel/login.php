<?php
class login{

static function hash($d){return password_hash($d,PASSWORD_DEFAULT);}
static function vrfpsw($d,$hash){return password_verify($d,$hash);}

static function register($p){$e='';
[$a,$b,$c]=vals($p,['name','mail','pswd']);
$ex=self::firstuser(); $auth=$ex?1:6; $psw=self::hash($c);
if($a && $b && $c)
$ok=sql::sav('users',[$a,$auth,$b,$psw]);
$ak=sql::sav('profile2',[$ok,$a,'here','linear-gradient(#797979,#4a4a4a)','']);
if($ok)self::auth($ok);
if($ok)$ret=div(voc('registered'),'frame-blue');
else $ret=div(voc('notregistered'),'frame-red');
return $ret;}

static function firstuser(){
return sql::read('id','users','v',1);}

static function form($p){
[$a,$b]=vals($p,['a','b']);
$ret=h3(voc('login'));
if(!self::firstuser())$ret.=div(voc('first_user'),'frame-white');
$ret.=bj(voc('go'),'content|login,call||name,pswd','btsav');
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
	$ret.=div(bh(voc('redo'),'login','btn'));
	$ret.=hidden('name',$a);
	$ret.=div(inpsw('pswd',$b).label('pswd',voc('password'),'btn'));
	$ret.=bj(voc('go'),'content|login,call||name,pswd','btsav');}
else{
	$ret=div(voc('inexistant_user'),'frame-red');
	$ret.=div(bh(voc('go'),'login','btn'));
	$ret.=hidden('name',$a).hidden('pswd',$b);
	$ret.=div(inpmail('mail','').label('mail',voc('knownmail'),'btn'));
	$ret.=bj(voc('register?'),'tgreg|login,register||name,mail,pswd','btsav');
	$ret.=div('','','tgreg');}
return $ret;}

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
if($uid)self::auth($uid);}

static function logout(){
sesz('usr');
sesz('uid');
sesz('auth');
setcookie('uid','',0);
//cookie('uid',0);
return $d=div(voc('loged_out'),'frame-white');
return [$d,blocks::menu([])];}

static function loged(){
$ret=div(voc('hello').' '.ses('usr'),'frame-blue');
$ret.=div(bj(voc('logout'),'content|login,logout','btn'));
return $ret;}

static function call($p){
[$a,$b]=vals($p,['name','pswd']);
if(ses('uid'))$ret=self::loged();
elseif($a && $b)$ret=self::response($p);
else $ret=self::form($p);
return $ret;}
}
?>