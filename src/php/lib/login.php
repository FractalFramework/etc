<?php
class login{
static $default_ban='IC1396-Hubble.jpg';
static $maintg='main';
static $er='';

static function hash($d){return password_hash($d,PASSWORD_DEFAULT);}
static function vrfpsw($d,$hash){return password_verify($d,$hash);}

static function uid($a){
return sql::read('id','users','v',['name'=>$a]);}

static function register($p){$ok='';
[$a,$b,$c]=vals($p,['name','mail','pswd']);
$ex=self::firstuser(); $auth=$ex?1:6; $psw=self::hash($c);
$ex=self::uid($a); if($ex)return alert('already_exists','red');
if(!filter_var($b,FILTER_VALIDATE_EMAIL))return alert('bad_mail','red');
if($a && $b && $c && !$ex)$ok=sql::sav('users',[$a,$auth,$b,$psw,uip()]);
if($ok)$ak=sql::sav('profile',[$ok,$a,'here',self::$default_ban,'']);
if($ok)self::identify($ok);
if($ok)$ret=alert('registered','blue');
else $ret=alert('notregistered','red');
return $ret;}

static function firstuser(){
return sql::read('id','users','v',1);}

static function form($p){
[$a,$b]=vals($p,['a','b']);
$ret=h3(voc('login_bt'));
if(!self::firstuser())$ret.=alert('first_user','white');
$ret.=bj(',|login,port||name,pswd',voc('go'),'btsav',['id'=>'logbt']);
$ret.=div(inputj('name','','logbt').label('name',voc('knowname')));
$ret.=div(inputj('pswd','','logbt',['type'=>'password']).label('pswd',voc('password')));
return $ret;}

static function response($p){
[$a,$b]=vals($p,['name','pswd']);
$uid=sql::read('id','users','v',['name'=>$a]);
$psw=sql::read('pswd','users','v',['id'=>$uid]);
$ok=self::vrfpsw($b,$psw);
if($ok){self::identify($uid); $ret=alert('loged','green',$a).bh('/',icovoc('home'),'bigbt');}
elseif($uid){
	$ret=alert('bad_password','red');
	$ret.=div(bh('login',voc('redo'),'btn'));
	$ret.=hidden('name',$a);
	$ret.=div(inpsw('pswd',$b).label('pswd',voc('password')));
	$ret.=bj(',|login,port||name,pswd',voc('go'),'btsav');}
else{
	$ret=alert('inexistant_user','red');
	$ret.=div(bh('login',voc('go'),'btn'));
	$ret.=hidden('name',$a).hidden('pswd',$b);
	$ret.=div(inpmail('mail','').label('mail',voc('knownmail')));
	$ret.=bj(',|login,port_register||name,mail,pswd',voc('register?'),'btsav');
	$ret.=div('','','tgreg');}
return $ret;}

static function identify($id=''){
$r=sql::inner('b1.id,uid,b1.name,auth,slogan,logo,ip','users','profile','uid','a',['b1.id'=>$id]);
if(!$r)return;// pr($r); trace();
cookie('uid',$r['id']);
ses('uid',$r['id']);
ses('usr',$r['name']);
ses('auth',$r['auth']); //auth(6);
ses::$r['usr']=$r;} //ses::usr('name');

static function resetpsw(){}//todo

static function resetip(){
$ip=sql::read('ip','users','v',['id'=>ses('uid')]);
if($ip!=uip())sql::upd('users',['ip'=>uip()],['id'=>ses('uid')]);}

static function recognize2(){
if(ses('uid'))return;
$uid=sql::read('id','users','v',['ip'=>uip()]);
if($uid && !ses('uid'))self::identify($uid);
if(!ses('uid'))ses('auth',0);}//visitor===0

static function recognize(){//called from boot
if(ses('uid'))return;
//cookiz('uid');//not works
$uid=cookie('uid'); //pr($_COOKIE); //cookie is rebuilt the second time we come there
if($uid && !ses('uid') && !sesx('auth'))self::identify($uid);
if(!ses('uid'))ses('auth',0);}//visitor===0

static function logout(){
sesz('usr');
sesz('uid');
ses('auth',0);
cookiz('uid');
cookiz('PHPSESSID');
$ret=alert('loged_out','blue');
$ret.=bh('home',icovoc('back'),'bigbt');
return $ret;}

static function loged(){
$ret=alert('hello','blue',ses('usr'));
$ret.=div(bj(',|login,port_logout',voc('logout'),'bigbt'));
return $ret;}

static function call($p){
[$a,$b]=vals($p,['name','pswd']);
if(ses('uid'))$ret=self::loged();
elseif($a && $b)$ret=self::response($p);
else $ret=self::form($p);
return $ret;}

static function port_register($p){
$r[self::$maintg]=self::register($p);
$r['nav']=nav::call(['a'=>'login']);
return $r;}

static function port_logout($p){
$r[self::$maintg]=self::logout();
$r['nav']=nav::call(['a'=>'login']);
return $r;}

static function port($p){
$r[self::$maintg]=self::call($p);
$r['nav']=nav::call(['a'=>'login']);
return $r;}

}
?>
