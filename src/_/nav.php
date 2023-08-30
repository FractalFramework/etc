<?php
class nav{
    
//$rt[$com]=[$bt,$ico,$auth];
static function defaults(){
    //$rt['home']=['home','home',0];
    //$rt['post']=['sarticles','folder',0];
    //$r=sql::inner('distinct(category)','cats','posts','catid','rv','where pub>0');
    //foreach($r as $k=>$v)$rt[]=$rt['posts/'.$v]=[$v,'folder',0];
    $rt[]=['','',0];
    $rt['contact']=['contact','mail',0];
    $rt['search']=['search','search',-1];
    $rt['create']=['create','plus',1];
    $rt['login']=['login','login',0];
    $rt['user']=['#user','user',1];
    $rt['admin']=['admin','admin',6];
return $rt;}

static function datas(){$rt=[];
    $r=json::call('cnfg/nav'); $ath=ses('auth');
    $r+=self::defaults();
    foreach($r as $com=>$v){[$bt,$ico,$auth]=$v;
        if(substr($com,0,4)=='art:')$com='posts/'.substr($com,4);
        if($bt=='#user')$bt=ses('usr');
        if(!$bt)$rt[]=div('','line');
        elseif($auth<=$ath)$rt[]=bh($com,span(ico($ico).thin().$bt,'react'));}
    return $rt;}
    
static function call($p){
    $ra=self::datas();
    $rb['nav']=div(join('',$ra));
    return view::call('blocks/nav',$rb);}
}