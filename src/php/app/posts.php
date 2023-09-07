<?php
class posts{

#edit
static function usrart($id){
return sql::read('uid','posts','v',$id);}

static function catid($a){
$catid=sql::read('id','cats','v',['category'=>$a]);
if(!$catid)$catid=sql::sav('cats',[$a]);
return $catid;}

static function content($p){
$d=sql::read('content','posts','v',$p['id']);
return conn::embed_p($d);}

static function del($p){
[$a,$b,$ok]=vals($p,['a','b','ok']);
if(!$ok){
    $ret=bj('main|posts,del|a='.$a.',ok=1',icovoc('cry','really?'),'btdel');
    $ret.=bj('main|posts,read|a='.$a,icovoc('laugh','no!'),'btn');
    return $ret;}
else sql::upd('posts',['pub'=>-1],['id'=>$a]);
return bh('main|posts,call',icovoc('back','done'),'bigbt');}

static function save($p){
[$a,$b,$c,$d]=vals($p,['cat','tit','exc','msg']);
$catid=self::catid($a);
$ex=sql::sav('posts',[ses('uid'),$catid,$b,$c,$d,0,sqldate()],0);
if($ex)return self::read(['a'=>$ex,'b'=>'']);
else return alert('error','red');}

static function update($p){
[$id,$c,$d]=vals($p,['id','col','val']);
$d=$d=conv::build(['txt'=>$d]);
$r=[$c=>$c=='catid'?self::catid($d):$d];
if($d)sql::upd('posts',$r,$id);
if($c=='content')$d=conn::build(['txt'=>$d,'m'=>0,'id'=>$id]);
return $d;}

static function create($p){
$ex=sql::read('id','posts','v',['uid'=>ses('uid'),'title'=>voc('title')]);
if(!$ex)$ex=self::save(['cat'=>'public','tit'=>voc('title'),'exc'=>voc('excerpt'),'msg'=>voc('text')]);
return self::read(['a'=>$ex]);}

#play
static function datas($p){$q=[];
[$a,$b,$inp]=vals($p,['a','b','inp']);
if(is_numeric($a))$q['b2.id']=$a;
elseif($a)$q['category']=$a;
if($inp)$q['%content']=$inp;
$pbs=['1']; if(auth(4)){$pbs[]='0'; $pbs[]=-1;} $q['pub(']=$pbs;
$q['_group']='b2.id';
$cl='b2.id,uid,title,category,excerpt,content,pub,date_format(lastup,"%d/%m/%Y") as up';
$r=sql::inner($cl,'cats','posts','catid','ra',$q);
return $r;}

static function read($p){
[$a,$b]=vals($p,['a','b']); $pr=[]; $pr1=[]; $pr2=[];
$r=self::datas($p); if($r)$r=$r[0];
if(!$r)return alert('nothing','red');
$own=ses('uid')==$r['uid']?1:0;
if(!auth(4) && $own && $r['pub']<1)return alert('moderated','red');
if(auth(6) or ($own && $r['pub']>0)){
    $pr=['contenteditable'=>'false','class'=>'editable'];
    $pr1=['onclick'=>'editxt(this,'.$a.')','onblur'=>'savtxt(this,'.$a.')'];
    $pr2=['ondblclick'=>'editbt(\'content\','.$a.',1)'];}//,'onblur'=>'savtxt(this,'.$a.',1)'
$r['date']=$r['up'];
$r['author']=sql::read('name','users','v',['id'=>$r['uid']]);
$r['pub']=auth(4)?admin::bt($a,$r['pub'],'posts'):'';
$r['pub'].=auth(4)?bj('post'.$a.'|posts,del|a='.$a,ico('trash'),''):'';
$r['title']=tag('div',['id'=>'title']+$pr+$pr1,$r['title']);
$r['excerpt']=tag('div',['id'=>'excerpt']+$pr+$pr1,$r['excerpt']);
$r['category']=tag('span',['id'=>'catid']+$pr+$pr1,$r['category']);
$txt=conn::build(['txt'=>$r['content'],'m'=>0,'id'=>$a]);
$r['content']=tag('div',['id'=>'content']+$pr+$pr2,$txt);
//$r['editbt']='';
$r['editbt']=conns::btedt(['id'=>$a,'sav'=>1]);
//$r['editbt']=auth(4)?btj('editbt',['content',$a],voc('edit'),'btn',['id'=>'bt'.$a]):'';
$r['tracks']=tracks::call($p);
$bt=bh('posts',icovoc('back','back'),'bigbt');
$ret=view::call('post',$r);
return $bt.$ret;}

static function stream($p){
[$a,$b,$inp]=vals($p,['a','b','inp']);
$ret=div(bj('main|post,call||inp',icovoc('gosearch','search_bt','react'),'btsav').' '.input('inp',$inp,14),'right');
$ret.=h3($a?ucfirst($a):voc('posts_title'));
$r=self::datas($p);
$ret.=div(count($r).' '.voc('posts_nb_title'),'bigbt');
if(auth(4))$ret.=bh('create',icovoc('plus','create_bt','react'),'bigbt');
foreach($r as $k=>$v){
    $r[$k]['date']=$v['up'];
    //$r[$k]['pub']=auth(4)?admin::bt($v['id'],$v['pub'],'posts'):'';
    $r[$k]['author']=sql::read('surname','profile2','v',['uid'=>$v['uid']]);
    $r[$k]['tracks_nb']=sql::read('count(id)','tracks','v',['bid'=>$v['id']]);
    $r[$k]['tracks_nb_title']=voc('tracks_nb_title');}
foreach($r as $k=>$v)$ret.=view::call('posts',$v);
return $ret;}

static function call($p){
if(is_numeric($p['a']??''))$ret=self::read($p);//avoid post/public
else $ret=self::stream($p);
return $ret;}

}
?>