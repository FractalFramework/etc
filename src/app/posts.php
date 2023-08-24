<?php
class posts{

    static function engine($p){$rb=[];
        $inp=$p['inp']??'';
        $r=sql::read('id,title','posts','kv',['%content'=>$inp]);
        if(!$r)$rb[]=div(voc('zero').' '.voc('result'),'frame-red');
        else $rb[]=div(count($r).' '.voc('results'),'frame-blue');
        foreach($r as $k=>$v)$rb[]=self::call('posts',['id'=>$k]);
        return join($rb);
    }

    /*static function search($p){
        //[$a,$b,$inp]=vals($p,['a','b','inp']);
        $ret=h3(voc('search'));
        $ret.=bj(icovoc('search','go'),'tgsearch|post,engine||inp','btsav');
        $ret.=input('inp','markdown');
        $ret.=div('','','tgsearch');
        return $ret;
    }*/

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

    static function format($d){
        $d=strip_tags($d);
        $d=delbr($d);
        $d=delr($d,"\n");
        return $d;
    }

    static function save($p){
        [$a,$b,$c,$d]=vals($p,['cat','tit','exc','msg']);
        $catid=self::catid($a);
        $ex=sql::sav('posts',[ses('uid'),$catid,$b,$c,$d,0,sqldate()],0);
        //if($ex)return div(voc('saved'),'frame-green');
        if($ex)return self::read(['a'=>$ex,'b'=>'']);
        else return div(voc('error'),'frame-red');
    }

    static function form($p){
        [$a,$b]=vals($p,['a','b']);
        $ret=h3(voc('new_post'));
        $r=sql::inner('distinct(category)','cats','posts','catid','rv',[]);
        $ret.=bj(icovoc('send'),'content|posts,save||cat,tit,exc,msg','btsav');
        //$ret.=div(select('cat',$r,'public').label('cat',voc('category'),'btn'));
        $ret.=div(datalist('cat',$r,'public',12,'').label('cat',voc('category'),'btn'));
        $ret.=div(label('tit',voc('title'),'btn'));
        $ret.=div(input('tit','',64),'area');
        $ret.=div(label('exc',voc('excerpt'),'btn'));
        $ret.=div(textarea('exc','',64,2),'area');
        $ret.=div(label('msg',voc('message'),'btn'));
        $ret.=div(textarea('msg','',64,16),'area');
        return div($ret,'','tgmail');
    }

    static function update($p){
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
    }

    static function edit($p){
        [$a,$b]=vals($p,['a','b']); if(!is_numeric($a))return self::stream($p);
        //return edit::form(['b'=>'posts','id'=>$a,'rid'=>'content']);
        $r=sql::inner('uid,title,category,excerpt,content,date_format(lastup,"%d/%m/%Y") as up','cats','posts','catid','a',['b2.id'=>$a],0);
        if($r['uid']!=ses('uid') && !auth(4))return blocks::forbidden();
        $rb=sql::inner('distinct(category)','cats','posts','catid','rv',[]);
        $r['date']=$r['up'];
        $r['title']=divarea('p1',$r['title']);
        $r['excerpt']=divarea('p3',$r['excerpt']);
        $r['author']=sql::read('name','users','v',['id'=>$r['uid']]);
        $r['editbt']=bj(ico('back'),'content|posts,read|a='.$a,'btdel');
        $r['editbt'].=bj(icovoc('modif','modif'),'content|posts,update|id='.$a.'|p1,p2,p3,p4','btsav');
        //$r['editbt'].=div(select('cat',$rb,'public').label('cat',voc('category'),'btn'));
        $r['editbt'].=datalist('p2',$rb,$r['category'],12,'');
        //$r['editbt'].=self::editbt();
        //$r['content']=divarea('p4',$r['content']);
        $r['editbt'].=conn::bt('p4');
        $r['content']=div(textarea('p4',$r['content'],'',16),'area');
        $r['tracks']='';
        $ret=view::call('blocks/post',$r);
        return $ret;
    }

    static function read($p){
        [$a,$b]=vals($p,['a','b']);
        if($b=='edit')return self::edit($p);
        $r=sql::inner('uid,title,category,excerpt,content,date_format(lastup,"%d/%m/%Y") as up','cats','posts','catid','a',['b2.id'=>$a],0);
        $r['date']=$r['up'];//day()
        $r['author']=sql::read('name','users','v',['id'=>$r['uid']]);
        $r['tracks']=tracks::call($p);
        $r['editbt']=auth(4)?bj(icovoc('edit','edit'),'content|posts,edit|a='.$a,'btn'):'';
        $r['content']=conn::call(['msg'=>$r['content'],'m'=>0,'id'=>$a]);
        $ret=view::call('blocks/post',$r);
        return $ret;
    }

    static function stream($p){
        [$a,$b]=vals($p,['a','b']);
        $ret=div(bj(icovoc('search','search','react'),'content|post,engine||inp','btsav').' '.input('inp','',14),'right');
        $ret.=h3(voc('posts_title'));
        $sq=['pub'=>1];
        if($a)$sq['category']=$a;
        $r=sql::inner('b2.id,uid,title,category,excerpt,date_format(b2.up,"%d/%m/%Y") as up','cats','posts','catid','ra',$sq);
        $ret.=div(count($r).' '.voc('posts_nb_title'),'block-inline');
        foreach($r as $k=>$v){
            $r[$k]['bt_title']=bh($v['title'],'post/'.$v['id']);
            $r[$k]['date']=$v['up'];
            //$r[$k]['author']=sql::read('name','users','v',['id'=>$v['uid']]);
            $r[$k]['author']=sql::read('surname','profile2','v',['uid'=>$v['uid']]);
            $r[$k]['category']=bh(icovoc('folder',$v['category']),'posts/'.$v['category']);
            $r[$k]['tracks_nb']=sql::read('count(id)','tracks','v',['bid'=>$v['uid']]);
            $r[$k]['tracks_nb_title']=voc('tracks_nb_title');}
        foreach($r as $k=>$v)$ret.=view::call('blocks/posts',$v);
        return $ret;
    }

    static function call($p){
        [$a,$b,$inp]=vals($p,['a','b','inp']);
        //if($inp)$r=self::engine($p);
        //else $r=self::stream($p);
        $ret=self::stream($p);
        return $ret;
    }

}