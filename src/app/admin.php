<?php
class admin{

static function pub($p){
[$id,$b]=vals($p,['id','b']);
$pub=sql::read('pub',$b,'v',['id'=>$id]);
$pub2=$pub==1?0:1; if($pub==-1)$pub2=0;
sql::upd($b,['pub'=>$pub2],['id'=>$id]);
return self::btswitch($id,$pub2,$b);}

static function btswitch($id,$pub,$b){
$r=[-1=>'trash',0=>'off',1=>'on']; $bt=voc($r[$pub]);
$r=[-1=>'btno',0=>'btoff',1=>'bton']; $c=$r[$pub];
$ret=bj($b.'pub'.$id.'|admin,pub|id='.$id.',b='.$b,$bt,$c);
return $ret;}

static function bt($id,$pub,$b='posts'){
return span(self::btswitch($id,$pub,$b),'',$b.'pub'.$id);}

static function waiting($b){
if($b=='tracks')$cnt='txt'; else $cnt='excerpt';
$r=sql::inner('b2.id,name,'.$cnt.',pub','users',$b,'uid','ra',['_order'=>'b2.id desc']);
foreach($r as $k=>$v){
	$r[$k]['id']=bh('post/'.$v['id'],$v['id'],'btn');
	$r[$k]['pub']=self::bt($v['id'],$v['pub'],$b);}
return build::tabler($r,['id','author',$cnt,'pub']);}

static function jsonfiles(){
$dr='public/json';
$r=scandir_r($dr);
foreach($r as $k=>$v){
	$vb=str_replace([$dr.'/','.json'],'',$v);
	$rt[]=bj('jmnu|json,edit|a='.$vb,$vb);}
return join('',$rt);}

static function call($p){
if(!auth(6))return div(voc('forbiden'),'frame-red');
$rt[voc('tracks')]=h2(voc('tracks_moderation')).div(self::waiting('tracks'));
$rt[voc('posts')]=h2(voc('posts_moderation')).div(self::waiting('posts'));
$rt[voc('contacts')]=h2(voc('contacts')).div(contact::read($p));
$rt['json']=h2('json').div(self::jsonfiles(),'menu').div('','','jmnu');
return build::tabs($rt);}
}
?>