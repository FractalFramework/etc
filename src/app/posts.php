<?php
class posts{

static function catid($a){
$catid=sql::read('id','cats','v',['category'=>$a]);
if(!$catid)$catid=sql::sav('cats',[$a]);
return $catid;}

static function content($p){
$d=sql::read('content','posts','v',$p['id']);
return conn::embed_p($d);}

static function del($p){
[$a,$b,$ok]=vals($p,['a','b','ok']);
if(!$ok)return bj(voc('sure?'),'post'.$b.'|posts,del|a='.$a.',ok=1','btdel');
else sql::upd('posts',['pub'=>-1],['id'=>$a]);}

static function save($p){
[$a,$b,$c,$d]=vals($p,['cat','tit','exc','msg']);
$catid=self::catid($a);
$ex=sql::sav('posts',[ses('uid'),$catid,$b,$c,$d,0,sqldate()],0);
if($ex)return self::read(['a'=>$ex,'b'=>'']);
else return div(voc('error'),'frame-red');}

static function update($p){
[$id,$c,$d]=vals($p,['id','col','val']);
$d=$d=conv::call(['txt'=>$d]);
$r=[$c=>$c=='catid'?self::catid($d):$d];
if($d)sql::upd('posts',$r,$id);
if($c=='content')$d=conn::call(['msg'=>$d,'m'=>0,'id'=>$id]);
return $d;}

static function create($p){
$ex=sql::read('id','posts','v',['uid'=>ses('uid'),'title'=>voc('title')]);
if(!$ex)$ex=self::save(['cat'=>'public','tit'=>voc('title'),'exc'=>voc('excerpt'),'msg'=>voc('text')]);
return self::read(['a'=>$ex]);}

static function datas($p){$q=[];
[$a,$b,$inp]=vals($p,['a','b','inp']);
if(is_numeric($a))$q['b2.id']=$a;
elseif($a)$q['category']=$a;
if($inp)$q['%content']=$inp;
$q['_group']='b2.id';
$cl='b2.id,uid,title,category,excerpt,content,pub,date_format(lastup,"%d/%m/%Y") as up';
$r=sql::inner($cl,'cats','posts','catid','ra',$q);
return $r;}

static function read($p){
[$a,$b]=vals($p,['a','b']); $pr=[];
$r=self::datas($p); if($r)$r=$r[0];
if(!$r)return div(icovoc('nothing'),'frame-red');
if(!auth(4) && $r['pub']==0)return div(icovoc('moderated'),'frame-red');
if(auth(6) or $r['uid']==ses('uid')){
    $pr=['contenteditable'=>'false','class'=>'editable'];
    $pr1=['onclick'=>'editxt(this,'.$a.')','onblur'=>'savtxt(this,'.$a.')'];
    $pr2=['ondblclick'=>'editbt(\'content\','.$a.',1)','onblur'=>'savtxt(this,'.$a.',1)'];}
$r['date']=$r['up'];
$r['author']=sql::read('name','users','v',['id'=>$r['uid']]);
$r['pub']=auth(4)?admin::bt($a,$r['pub'],'posts'):'';
$r['pub'].=auth(4)?bj(voc('del'),'post'.$a.'|posts,del|a='.$a,'btdel'):'';
$r['title']=tag('div',['id'=>'title']+$pr+$pr1,$r['title']);
$r['excerpt']=tag('div',['id'=>'excerpt']+$pr+$pr1,$r['excerpt']);
$r['category']=tag('span',['id'=>'catid']+$pr+$pr1,$r['category']);
$txt=conn::call(['msg'=>$r['content'],'m'=>0,'id'=>$a]);
//$txt=$r['content'];
$r['content']=tag('div',['id'=>'content']+$pr+$pr2,$txt);
$r['editbt']=auth(4)?btj(voc('edit'),'editbt',['content',$a],'btn',['id'=>'bt'.$a]):'';
$r['tracks']=tracks::call($p);
$ret=view::call('blocks/post',$r);
return $ret;}

static function stream($p){
[$a,$b,$inp]=vals($p,['a','b','inp']); $uid=ses('uid');
$ret=div(bj(icovoc('gosearch','search','react'),'main|post,call||inp','btsav').' '.input('inp',$inp,14),'right');
$ret.=h3(voc('posts_title'));
$r=self::datas($p);
$ret.=div(count($r).' '.voc('posts_nb_title'),'block-inline');
if(auth(4))$ret.=div(bh(icovoc('plus','create_bt','react'),'create'),'block-inline');
foreach($r as $k=>$v)if(auth(6) or $v['uid']==$uid){
    $r[$k]['date']=$v['up'];
    //$r[$k]['pub']=auth(4)?admin::bt($v['id'],$v['pub'],'posts'):'';
    $r[$k]['author']=sql::read('surname','profile2','v',['uid'=>$v['uid']]);
    $r[$k]['tracks_nb']=sql::read('count(id)','tracks','v',['bid'=>$v['uid']]);
    $r[$k]['tracks_nb_title']=voc('tracks_nb_title');}
foreach($r as $k=>$v)$ret.=view::call('blocks/posts',$v);
return $ret;}

static function call($p){
$ret=self::stream($p);
return $ret;}

}