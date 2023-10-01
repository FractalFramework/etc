<?php
class conns{
#edit
static function connbt($p){$rt=[];
$r=json::call('sys/conn'); $id=$p['id']??''; $a=$p['a']??0;
foreach($r as $k=>$v){[$t,$o,$b]=arr($v,3); if($o)$o='|'.$o;
	if($a==$b)$rt[]=btj('embed',['[',$o.':'.$k.']',$id],$k,'',['title'=>$t]);}
return join('',$rt);}

static function btedt($p){$id=$p['id']??'';
$ret=btj('embed',['[',']',$id],'[ ]');
$ret.=self::connbt($p);
if($p['sav']??'')$ret.=btj('editbt',['content',$id],ico('save'),'btsav',['id'=>'bt'.$id]);
if($p['bt']??'')$ret.=$p['bt'];
$ret.=togj(ico('...'),'conns,connbt|a=1,id='.$id);
return div($ret,'menu');}

#builders
static function trademark($d){return img('/img/socials/'.$d.'.png','16px');}
static function lnk_tm($u,$t='',$ic=''){if($ic)$t=self::trademark($ic).$t; return lk($u,$t?$t:domain($u));}
static function dl($d,$t=''){return ico('download').' '.($t?$t:domain($d));}

static function lnk($u,$t=''){
$r=['twitter','youtube','facebook','linkedin','instagram'];
foreach($r as $k=>$v)if(strpos($u,$v)){
	//if(method_exists('conns',$v))return self::$v($u,$t); else
	return self::lnk_tm($u,$t,$v);}
$r=['mp3','mp4','pdf','epub','svg','txt','md','gz','zip']; $xt=xt($u,1);
foreach($r as $k=>$v)if($xt==$v)
	//if(method_exists('conn',$v))$d=self::$v($u); else
	return self::lnk_tm($u,$t,'url');
return lk($u,$t);}

//medias
/*static function twalter($u,$id,$o=''){$sn='';
if(strpos($u,'/')){$ra=explode('/',$u); $sn=$ra[3]??''; $twid=$ra[5]??'';} else $twid=$u;//forbidden situation
$ra=['name','screen_name','user_id','date','text','media','lang'];
$r=sql::read(implode(',',$ra),'twit','a',['twid'=>$twid],0);
if($r && !$o)return self::play($twid,$r,[],0,$id);
$rb=self::r(); foreach($rb as $k=>$v)$rb[$k]=$v=='int'||$v=='bint'?0:'';
$rb['twid']=$twid; if($id)$rb['ib']=$id; $rb['date']=time(); if($sn)$rb['screen_name']=$sn;
$lk=self::lk($sn?$sn:'unknown',$twid);
$ret=lkt('txtx',$lk,pictxt('url',$sn));
[$res,$nm,$sn]=self::oembed($lk);
[$txt,$med]=self::clean($res); $med=utmsrc($med);
$rb['text']=$txt; if($nm)$rb['name']=$nm; $rb['media']=$med; $rb['screen_name']=$sn;
if($o && $r)sqlup('qdtw',$rb,['twid'=>$twid],0);
elseif($txt && auth(6) && $id!='test')sqlsav('qdtw',$rb,0,0);
return self::play($twid,$rb,[],$o,$id);}*/

static function youtube($u,$t){
if($t)return self::lnk_tm($u,$t,'youtube');
$ico=ico('video'); $id=strend($u,'?v='); $id=strto($id,'&');
$tm=strpos($u,'t=')?'&t='.between($u,'t=','&'):'';
$im='https://img.youtube.com/vi/'.$id.'/hqdefault.jpg';
return build::iframe('https://www.youtube.com/embed/'.$id.$tm);}

static function video($u,$t){
$r=['youtube','vimeo','odysee','vk'];
foreach($r as $k=>$v)if(strpos($u,$v)){
	if(method_exists('conns',$v))return self::$v($u,$t);}
return lnk($u,$t);}

static function mp3($u,$t){return audio($u);}
static function mp4($u,$t){return video($u);}

static function list($p){$r=explode("\n",$p); return build::mkli($r,'ul');}
static function numlist($p){$r=explode("\n",$p); return build::mkli($r,'ol');}

#conns
static function art($id,$t=''){
if(!$t)$t=sql::read('title','posts','v',$id);
return bh('post/'.$id,ico('url').thin().$t,'btn');}

static function read($id,$o=''){$d='';
if(!$o)$d=posts::content(['id'=>$id]);
$t=sql::read('title','posts','v',$id);
$ret=h3(bg('cnt'.$id.'|conns,read_content|id='.$id,$t,!$o?'active':''));
$ret.=div($d,'','cnt'.$id);
return $ret;}

//apps
static function md($d,$o=''){
$d=conv::md2conn($d);
$d=conn::parser($d);
if($o){$d=conn::embed_p($d); $d=nl2br($d);}
return $d;}

static function profile($id,$o=''){
$uid=posts::usrart($id); if(!$uid)$uid=cnfg('usrhome'); //if(!$uid)$uid=ses('uid');
$r=sql::inner('name,surname,mail,slogan,logo','users','profile2','uid','a',['b1.id'=>$uid]);
if(!$r)return;
$ret=h2($r['surname']);
$ret.=h3($r['slogan']); 
$f=imgroot($r['logo']);
if(isimg($r['logo']))$ret.=img($f,'180px');
return $ret;}

static function socials($id,$o=''){$rt=[];
$uid=posts::usrart($id); if(!$uid)$uid=cnfg('usrhome');
$r=sql::read('url','socials','rv',['uid'=>$uid]); if(!$r)return;
foreach($r as $k=>$v)$rt[]=self::lnk($v);
return rdiv($rt);}

static function code($d){
$d=str_replace(['<?php','?>'],'',$d); $d=trim($d);
ini_set('highlight.comment','gray');
ini_set('highlight.default','white');
ini_set('highlight.html','red');
ini_set('highlight.keyword','orange');
ini_set('highlight.string','lightblue');
$d=highlight_string('<'.'?php'."\n".$d,true);
$d=str_replace(['&lt;?php','?>','><br />'],['','','>'],$d);
$d=trim($d,'<br />');
return div($d,'','','overflow:auto; wrap:true; background:#222244; padding:0 20px;');}

}
?>