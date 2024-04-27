<?php
class admin{

static function pub($p){
[$id,$b]=vals($p,['id','b']);
$pub=sql::read('pub',$b,'v',['id'=>$id]);
$pub2=$pub==1?0:1; if($pub==-1)$pub2=0; if($pub==-2)$pub2=-1;
sql::upd($b,['pub'=>$pub2],['id'=>$id]);
return self::btswitch($id,$pub2,$b);}

static function btswitch($id,$pub,$b){
$r=[-1=>'trash',0=>'off',1=>'on']; $bt=voc($r[$pub]);
$r=[-1=>'btno',0=>'btoff',1=>'bton']; $c=$r[$pub];
$ret=bj($b.'pub'.$id.'|admin,pub|id='.$id.',b='.$b,$bt,$c);
if($pub==0)$ret=bj($b.'pub'.$id.'|admin,pub|id='.$id.',b='.$b,$bt,$c);
return $ret;}

static function bt($id,$pub,$b='posts'){
return span(self::btswitch($id,$pub,$b),'',$b.'pub'.$id);}

static function pending_tracks(){
$r=sql::inner('b2.id,name,txt,pub','users','tracks','uid','ra',['_order'=>'b2.id desc']);
foreach($r as $k=>$v){
	$r[$k]['id']=bh('post/'.$v['id'],$v['id'],'btn');
	$r[$k]['pub']=self::bt($v['id'],$v['pub'],'tracks');}
return build::tabler($r,['id','author','txt','pub']);}

static function pending_posts(){
$r=sql::inner('b2.id,name,catid,excerpt,pub','users','posts','uid','ra',['_order'=>'b2.id desc']);
foreach($r as $k=>$v){
	$r[$k]['id']=bh('post/'.$v['id'],$v['id'],'btn');
	$r[$k]['pub']=self::bt($v['id'],$v['pub'],'posts');}
return build::tabler($r,['id','author','catid','excerpt','pub']);}

static function apps(){
$r=['conn','conv','test','docs'];
return $r;}

static function appsmenu(){
$rb=[]; $r=self::apps();
foreach($r as $v)$rb[]=bj('japp|'.$v.',call',span($v));
return $rb;}

static function user(){//if(!ses('uid'))return;
$id=sql::read('id','profile','v',['uid'=>ses('uid')]);
$rt['profile']=dbedt::call(['a'=>'profile','id'=>$id]);
$rt['socials']=dbedt::call(['a'=>'socials','id'=>'']);
return build::tabs($rt);}

static function call($p){
if(!auth(6))return alert('forbiden','red');
$rt[voc('tracks')]=h2(voc('tracks_moderation')).div(self::pending_tracks());
$rt[voc('posts')]=h2(voc('posts_moderation')).div(self::pending_posts());
$rt[voc('contacts')]=h2(voc('contacts')).div(contact::read($p));
$rt['json']=h2('json').div(jedt::menu(),'menu').div('','','jmnu');
if(auth(6))$rt['db']=h2('db').div(dbedt::call(['a'=>'']),'','edt');
$rt['apps']=h2('apps').div(join('',self::appsmenu()),'vlist').div('','','japp');
return build::tabs($rt);}
}
?>
