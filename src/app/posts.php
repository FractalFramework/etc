<?php
class posts{

    static function editbt(){//deprecated
    $r=['no'=>voc('none'),'p'=>'normal','h1'=>'h1','h2'=>'h2','h3'=>'h3','h4'=>'h4','h5'=>'h5'];
    $ret=select('wygs',$r,'','','execom2(this.value)');
    $r=['increaseFontSize'=>'+','decreaseFontSize'=>'-','bold'=>'b','italic'=>'i','underline'=>'u','strikeThrough'=>'k','insertUnorderedList'=>'list','Indent'=>'block','Outdent'=>'unblock','stabilo'=>'highlight','createLink'=>'url'];
    foreach($r as $k=>$v)$ret.=btj($v,'execom',[$k]);
    return span($ret,'menu');}

    static function catid($a){
        $catid=sql::read('id','cats','v',['category'=>$a]);
        if(!$catid)$catid=sql::sav('cats',[$a]);
        return $catid;
    }

    static function save($p){
        [$a,$b,$c,$d]=vals($p,['cat','tit','exc','msg']);
        $catid=self::catid($a);
        $ex=sql::sav('posts',[ses('uid'),$catid,$b,$c,$d,0,sqldate()],0);
        if($ex)return div(voc('saved'),'frame-green');
        else return div(voc('error'),'frame-red');
    }

    static function update($p){
        [$id,$t,$cat,$exc,$cnt]=vals($p,['id','petitle','pecategory','peexcerpt','pecontent']); 
        $no=secur::call('posts','update'); if($no)return $no;
        $catid=self::catid($cat);
        $rt=['title'=>$t,'catid'=>$catid,'excerpt'=>$exc,'content'=>$cnt];
        $nid=sql::upd('posts',$rt,$id);
        if($nid)$ret=div(voc('saved'),'frame-green');
        else $ret=div(voc('error'),'frame-red');
        $ret.=bh(voc('return'),'post/'.$id.'/edit','btn');
        return $ret;
    }

    static function edit($p){
        [$a,$b]=vals($p,['a','b']);
        //return edit::form(['b'=>'posts','id'=>$a,'rid'=>'content']);
        $r=sql::inner('uid,title,category,excerpt,content,date_format(lastup,"%d/%m/%Y") as up','cats','posts','catid','a',['b2.id'=>$a],0);
        if($r['uid']!=ses('uid'))return blocks::forbidden();
        $rb=sql::inner('distinct(category)','cats','posts','catid','rv',[]);
        //$ret.=div(select('cat',$r,'public').label('cat',voc('category'),'btn'));
        $r['author']=bh(ico('back'),'post/'.$a,'btn');
        $r['date']=self::editbt();
        $r['category']=datalist('pecategory',$rb,$r['category'],12,'');
        //$keys=implode(',',walk(array_keys($ra),'unid'));
        $r['edit']=bj(voc('update'),'content|posts,update|id='.$a.'|petitle,pecategory,peexcerpt,pecontent','btsav');
        $r['title']=divarea('petitle',$r['title']);
        $r['excerpt']=divarea('peexcerpt',$r['excerpt']);
        $r['content']=divarea('pecontent',$r['content']);
        $r['tracks']='';
        $ret=view::call('blocks/post',$r);
        return $ret;
    }

    static function form($p){
        [$a,$b]=vals($p,['a','b']);
        $ret=h3(voc('new_post'));
        $r=sql::inner('distinct(category)','cats','posts','catid','rv',[]);
        //$ret.=div(select('cat',$r,'public').label('cat',voc('category'),'btn'));
        $ret.=div(datalist('cat',$r,'public',12,'').label('cat',voc('category'),'btn'));
        $ret.=div(label('tit',voc('title'),'btn'));
        $ret.=div(input('tit','',64));
        $ret.=div(label('exc',voc('excerpt'),'btn'));
        $ret.=div(textarea('exc','',64,2));
        $ret.=div(label('msg',voc('message'),'btn'));
        $ret.=div(textarea('msg','',64,12));
        $ret.=bj(voc('send'),'tgmail|posts,save||cat,tit,exc,msg','btsav');
        $ret.=div('','','tgmail');
        return $ret;
    }

    static function read($p){
        [$a,$b]=vals($p,['a','b']);
        if($b=='edit')return self::edit($p);
        $r=sql::inner('uid,title,category,excerpt,content,date_format(lastup,"%d/%m/%Y") as up','cats','posts','catid','a',['b2.id'=>$a],0);
        $r['date']=$r['up'];//day()
        $r['author']=sql::read('name','users','v',['id'=>$r['uid']]);
        $r['tracks']=tracks::call($p);
        $r['edit']=auth(4)?bh(ico('edit'),'post/'.$a.'/edit',''):'';
        $ret=view::call('blocks/post',$r);
        return $ret;
    }

    static function stream($p){
        [$a,$b]=vals($p,['a','b']);
        $ret=h3(voc('posts_title'));
        $sq=['pub'=>1];
        if($a)$sq['category']=$a;
        $r=sql::inner('b2.id,uid,title,category,excerpt,date_format(b2.up,"%d/%m/%Y") as up','cats','posts','catid','ra',$sq);
        $ret.=block(count($r).' '.voc('posts_nb_title'));
        foreach($r as $k=>$v){
            $r[$k]['bt_title']=bh($v['title'],'post/'.$v['id']);
            $r[$k]['date']=$v['up'];
            $r[$k]['author']=sql::read('name','users','v',['id'=>$v['uid']]);
            //$r[$k]['author']=sql::read('surname','profile2','v',['uid'=>$v['uid']]);
            $r[$k]['tracks_nb']=sql::read('count(id)','tracks','v',['bid'=>$v['uid']]);
            $r[$k]['tracks_nb_title']=voc('tracks_nb_title');}
        foreach($r as $k=>$v)$ret.=view::call('blocks/posts',$v);
        return $ret;
    }

    static function call($p){
        $ret=self::stream($p);
        return $ret;
    }

}