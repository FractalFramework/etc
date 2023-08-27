<?php
class tracks{

static function del($p){
[$a,$b,$ok]=vals($p,['a','b','ok']);
if(!$ok){
    $ret=bj(voc('really?'),'track'.$b.'|tracks,del|a='.$a.',b='.$b.',ok=1','btdel');
    $ret.=bj(ico('laugh').voc('no!'),'track'.$b.'|tracks,read|a='.$b,'btn');
    return $ret;}
else sql::upd('tracks',['pub'=>-1],['id'=>$b]);}

static function edit($p){
[$a,$b]=vals($p,['a','b']);
$r=sql::read('id,title,category,excerpt,content,date','posts','a',['id'=>$a]);
$r['date']=date('ymd',strtotime($r['date']));
$r['name']=sql::read('name','users','v',['id'=>$a]);
$ret=view::call('blocks/post',$r);return $ret;}

static function save($p){
$uid=ses('uid'); $ret=''; $psw=''; $er=''; $ok=''; $psw=''; $ex='';
[$a,$b,$c,$d]=vals($p,['bid','msg','name','mail']);
$own=$uid==conns::usrart($a)?1:0;
if(!$uid && !$c)$er='required_name';
elseif(!$uid && !$d)$er='required_mail';
elseif($c && $d){$psw=unid(time());
    $uid=login::fastsave(['name'=>$c,'mail'=>$d,'pswd'=>$psw]);}
if($a && $b && $uid){$pub=$own?1:0;
    $ex=sql::sav('tracks',[$uid,$a,$b,$pub],0);
    if($ex)$ok='pending_track'; else $er='already_said';}
elseif(!$b)$er='empty';
elseif(!$a)$er='error';
if($er)$ret=div(voc($er),'frame-red');
elseif($ok && $own)$ret=self::read(['a'=>$ex]);
elseif($ok)$ret=div(voc($ok),'frame-green');
if($psw && $uid)$ret=div(voc('new_password').' '.tagb('pre',$psw),'frame-blue');
$ret.=bh(icovoc('back'),'post/'.$a,'block-inline');
return $ret;}

static function form($a){
$ret=bj(voc('send'),'track_form|tracks,save||bid,msg,name,mail','btsav');
//$ret.=div(textarea('msg','',64,12));
if(!auth(1))$ret.=input('name','','',['placeholder'=>'name']).inpmail('mail','');
else $ret.=hidden('name','').hidden('mail','');
$ret.=divarea('msg','','track-content');
$ret.=hidden('bid',$a);
return $ret;}

static function read($p){
[$a,$b]=vals($p,['a','b']);
$r=sql::inner('b2.id,name,txt,pub,date_format(b2.up,"%d/%m/%Y") as up','users','tracks','uid','a',['b2.id'=>$a]);
$r['date']=$r['up'];
$r['pub']=auth(4)?admin::bt($r['id'],$r['pub'],'tracks'):'';
$ret=view::call('blocks/track',$r);
return $ret;}

static function stream($p){
$ret='';
[$a,$b]=vals($p,['a','b']);
$pbs=['1']; if(auth(4))$pbs[]='0';
$q=['bid'=>$a,'pub('=>$pbs];
$r=sql::inner('b2.id,name,txt,pub,date_format(b2.up,"%d/%m/%Y") as up','users','tracks','uid','ra',$q);
if($r)foreach($r as $k=>$v){
    $r[$k]['date']=$v['up'];
    $r[$k]['pub']=auth(4)?admin::bt($v['id'],$v['pub'],'tracks'):'';
    $r[$k]['pub'].=auth(4)?bj(voc('del'),'track'.$v['id'].'|tracks,del|a='.$a.',b='.$v['id'],'btdel'):'';
    $ret.=view::call('blocks/track',$r[$k]);}
else $ret=ico('comment');
return $ret;}

static function call($p){
[$a,$b]=vals($p,['a','b']);
$r['tracks_title']=voc('tracks_title');
$r['tracks_nb']=sql::read('count(id)','tracks','v',['bid'=>$a,'pub'=>1]);
$r['tracks_nb_title']=voc('tracks_nb_title');
if(ses('uid'))$r['track_form']=self::form($a);
else $r['track_form']=bh(voc('need_auth'),'login','frame-red');
$r['tracks']=self::stream($p);
$ret=view::call('blocks/tracks',$r);
return $ret;}
}