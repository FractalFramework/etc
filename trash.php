<?php

//posts
    //stream
            //$r['editbt']=bj(icovoc('edit','edit'),'main|posts,edit|a='.$a,'btn');
            //$r['editbt']=bj(icovoc('edit','edit'),'title,excerpt,content|posts,editcom|a='.$a,'btn');
            //$r['editbt']=btj(icovoc('edit','edit'),'editart',$a,'btn');

    /*static function update($p){
        [$id,$t,$cat,$exc,$cnt]=vals($p,['id','p1','p2','p3','p4']); 
        $no=secur::call('posts','update'); if($no)return $no;
        $catid=self::catid($cat);
        $t=self::format($t); $exc=self::format($exc); $cnt=self::format($cnt);
        $rt=['title'=>$t,'catid'=>$catid,'excerpt'=>$exc,'content'=>$cnt];
        $nid=sql::upd('posts',$rt,$id);
        //if($nid)$ret=div(voc('saved'),'frame-green');
        if($nid)return self::read(['a'=>$id,'b'=>'']);
        else $ret=div(voc('error'),'frame-red');
        $ret.=bh(voc('return'),'post/'.$id.'/edit','btn');
        return $ret;
    }*/

    /*static function edit($p){
        [$a,$b]=vals($p,['a','b']); if(!is_numeric($a))return self::stream($p);
        //return edit::form(['b'=>'posts','id'=>$a,'rid'=>'content']);
        $r=sql::inner('uid,title,category,excerpt,content,pub,date_format(lastup,"%d/%m/%Y") as up','cats','posts','catid','a',['b2.id'=>$a],0);
        if($r['uid']!=ses('uid') && !auth(4))return blocks::forbidden();
        $rb=sql::inner('distinct(category)','cats','posts','catid','rv',[]);
        $r['date']=$r['up'];
        $r['title']=divarea('p1',$r['title']);
        $r['excerpt']=divarea('p3',$r['excerpt']);
        $r['author']=sql::read('name','users','v',['id'=>$r['uid']]);
        $r['editbt']=bj(ico('back'),'main|posts,read|a='.$a,'btdel');
        $r['editbt'].=bj(icovoc('modif','save'),'main|posts,update|id='.$a.'|p1,p2,p3,p4','btsav');
        //$r['editbt'].=div(select('cat',$rb,'public').label('cat',voc('category'),'btn'));
        $r['editbt'].=datalist('p2',$rb,$r['category'],12,'').label('p2',voc('category'),'btn');
        $r['editbt'].=admin::bt($a,$r['pub'],'posts');
        //$r['editbt'].=self::editbt();
        //$r['content']=divarea('p4',$r['content']);
        $r['editbt'].=conns::bt('p4');
        $r['content']=div(textarea('p4',$r['content'],'',16),'area');
        $r['tracks']='';
        $ret=view::call('blocks/post',$r);
        return $ret;
    }*/

    /*static function editcom($p){
        [$a,$b]=vals($p,['a','b']);
        $r=sql::read('uid,catid,title,excerpt,content,pub','posts','a',['id'=>$a]);
        if($r['uid']!=ses('uid') && !auth(4))return blocks::forbidden();
        $rb=sql::inner('distinct(category)','cats','posts','catid','rv',[]);
        $rt['title']=$r['title'];
        $rt['excerpt']=$r['excerpt'];
        $rt['editbt']=bj(ico('back'),'main|posts,read|a='.$a,'btdel');
        $rt['editbt'].=bj(icovoc('save','save'),'main|posts,update|id='.$a.'|p1,p2,p3,p4','btsav');
        //$rb['editbt'].=div(select('cat',$rb,'public').label('cat',voc('category'),'btn'));
        $rt['editbt'].=datalist('p2',$rb,$r['catid'],12,'').label('p2',voc('category'),'btn');
        $rt['editbt'].=admin::bt($a,$r['pub'],'posts');
        //$r['editbt'].=self::editbt();
        //$r['content']=divarea('p4',$r['content']);
        $rt['editbt'].=conns::bt('p4');
        $rt['content']=div(textarea('p4',$r['content'],'',16),'area');
        $rt['tracks']='';
        return $rt;
    }*/

    /*static function search($p){
        //[$a,$b,$inp]=vals($p,['a','b','inp']);
        $ret=h3(voc('search'));
        $ret.=bj(icovoc('search','go'),'tgsearch|post,engine||inp','btsav');
        $ret.=input('inp','markdown');
        $ret.=div('','','tgsearch');
        return $ret;
    }*/

    /*static function editbt(){//deprecated
        $r=['no'=>voc('none'),'p'=>'normal','h1'=>'h1','h2'=>'h2','h3'=>'h3','h4'=>'h4','h5'=>'h5'];
        $ret=select('wygs',$r,'','','execom2(this.value)');
        $r=['increaseFontSize'=>'+','decreaseFontSize'=>'-','bold'=>'b','italic'=>'i','underline'=>'u','strikeThrough'=>'k','insertUnorderedList'=>'list','Indent'=>'block','Outdent'=>'unblock','stabilo'=>'highlight','createLink'=>'url'];
        foreach($r as $k=>$v)$ret.=btj($v,'execom',[$k]);
        return span($ret,'menu');}*/
        
    /*static function form($p){
        [$a,$b]=vals($p,['a','b']);
        $ret=h3(voc('new_post'));
        $r=sql::inner('distinct(category)','cats','posts','catid','rv',[]);
        $ret.=bj(icovoc('send'),'main|posts,save||cat,tit,exc,msg','btsav');
        //$ret.=div(select('cat',$r,'public').label('cat',voc('category'),'btn'));
        $ret.=div(datalist('cat',$r,'public',12,'').label('cat',voc('category'),'btn'));
        $ret.=div(label('tit',voc('title'),'btn'));
        $ret.=div(input('tit','',64),'area');
        $ret.=div(label('exc',voc('excerpt'),'btn'));
        $ret.=div(textarea('exc','',64,2),'area');
        $ret.=div(label('msg',voc('message'),'btn'));
        $ret.=div(textarea('msg','',64,16),'area');
        return div($ret,'','tgmail');
    }*/

//conn    
    /*static function connbr($d){return $d;
    $r=[':q]',':h]',':h1]',':h2]',':h3]',':h4]',':ul]',':ol]',':pre]',':table]',':figure]',':video]',':php]',':photo]',':iframe]']; $n=count($r);
    for($i=0;$i<$n;$i++)$d=str_replace($r[$i]."\n\n",$r[$i]."\n",$d);
    return $d;}*/
    
    /*static function cprm($d){$n=mb_strrpos($d,'|'); if($n===false)$n=mb_strrpos($d,'§');
    if($n===false)return [$d,'']; else return [mb_substr($d,0,$n),mb_substr($d,$n+1)];}
    
    static function getconn($d){$p=$d; $c=''; $s=mb_strrpos($d,':');
    if($s!==false){$p=mb_substr($d,0,$s); $c=mb_substr($d,$s);}
    $xt=strtolower(strrchr($p,'.')); return [$p,$c,$xt];}
    
    static function readconn($d){$p=''; $c='';
    $s=strrpos($d,':'); if($s!==false){$c=substr($d,$s+1); $d=substr($d,0,$s);
    $s=strrpos($d,'|'); if($s!==false){$p=substr($d,$s+1); $d=substr($d,0,$s);}}
    return [$d,$p,$c];}*/

    /*static function poc($d){$p=''; $o=''; $c=''; $n=strrpos($d,'|'); $nb=strrpos($d,':');//p|o:c
    if($n!==false && $nb>$n){$p=substr($d,0,$n); $o=substr($d,$n+1,$nb-$n-1); $c=substr($d,$nb);
    if($o=='http'||$o=='https'){$o.=$c; $c='';}}
    elseif($n!==false && $nb<$n){$p=substr($d,0,$n); $o=substr($d,$n+1); $c='';}
    elseif($n!==false && $nb!==false){$p=substr($d,0,$nb); $o=substr($d,$nb+1,$n-$nb-1); $c=substr($d,$nb);
    if($p=='http'||$p=='https'){$p=substr($d,0,$n); $o=substr($d,$n+1); $c='';}}
    elseif($n===false && $nb!==false){$p=substr($d,0,$nb); $o=''; $c=substr($d,$nb);
    if($p=='http'||$p=='https'){$p.=$c; $c='';}}
    elseif($n===false && $nb===false){$p=$d; $o=''; $c='';}
    return [$p,$o,$c];}*/


/*$r=explode(',',$d); $d='';
foreach($r as $k=>$v){
	if($v=='up')$r[$k]=''.$b.'_up as '.$b.'_up';
	elseif($v=='time')$r[$k]='unix_timestamp('.$b.'_up) as '.$b.'_up';
	elseif($v=='date')$r[$k]='date_format('.$b.'_up,"%d/%m/%Y") as '.$b.'_up';
	elseif($v=='numday')$r[$k]='date_format('.$b.'_up,"%y%m%d") as '.$b.'_up';
	elseif($v=='numsec')$r[$k]='date_format('.$b.'_up,"%y%m%d.%H%i%s") as '.$b.'_up';} //pr($r);
$d=implode(',',$r);*/

/*static function build_password($d){
$rq=\Slim::getInstance()->request();
$q=json_decode($rq->getBody());
$hashedPassword=password_hash($q->password,PASSWORD_BCRYPT);}*/

/*static function verif_password($d,$hash){
return password_verify($d,$hash);}*/

/*static function test($p){
    [$a,$b]=vals($p,['a','b']);
    //$menu=bt('callj','ajax_call',['target','call','create_city_form'],'btn');
    $d=shell_exec('py public/python/test.py');
    if(!$d)$d='xxx';
    $r=['lk1'=>'/post','bt2'=>$d];
    $r['']=['lk2'=>'/post/1','bt2'=>$d];
    $r['']=['lk3'=>'/admin','bt3'=>$d];
    return view::call('blocks/test',$r);
}

static function test2($p){
    [$a,$b]=vals($p,['a','b']);
    $r=[];
    $ret=bj('hello','tg|blocks,post|p=1,o=2|inp');
    $ret.=input('inp','roo');
    $ret.=div('','','tg');
    return $ret;
}
*/