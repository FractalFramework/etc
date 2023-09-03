<?php
class nav{

//$rt[$com]=[$bt,$ico,$auth];
static function defaults(){
//$rt['home']=['home','home',0];
//$rt['post']=['sarticles','folder',0];
//$r=sql::inner('distinct(category)','cats','posts','catid','rv','where pub>0');
//foreach($r as $k=>$v)$rt[]=$rt['posts/'.$v]=[$v,'folder',0];
//$rt['addnav']=['menu','plus',1];
$rt[0]=['','',0];
$rt['contact']=['contact','mail',0];
//$rt['search']=['search','search',0];
//$rt['create']=['create','plus',1];
$rt['login']=['login','login',0];
$rt['user']=['#user','user',1];
$rt['admin']=['admin','admin',6];
return $rt;}

static function datas(){$rt=[]; $g=get('a');
$r=json::call('cnfg/nav'); $ath=ses('auth');
$r+=self::defaults();
foreach($r as $com=>$v){[$bt,$ico,$auth]=$v;
	if($bt)$bt=str_replace('#user',ses('usr'),$bt);
	if(!$bt)$rt[]=div('','line');
	elseif($auth<=$ath)$rt[]=bh($com,ico($ico).span(thin().$bt,'react'));}//,active($com,$g)
return $rt;}

static function call($p){
$ra=self::datas();
$rb['nav']=join('',$ra);
return view::call('blocks/nav',$rb);}

}
?>