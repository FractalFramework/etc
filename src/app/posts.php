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
    }

    static function editcom($p){
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
    }

    static function create($p){
        $ex=sql::read('id','posts','v',['uid'=>ses('uid'),'title'=>voc('title')]);
        if(!$ex)$ex=self::save(['cat'=>'public','tit'=>voc('title'),'exc'=>voc('excerpt'),'msg'=>voc('text')]);
        return self::edit(['a'=>$ex]);
    }

    static function read_content($p){
        return sql::read('content','posts','v',$p['id']);
    }

    static function read($p){
        [$a,$b]=vals($p,['a','b']);
        if($b=='edit')return self::edit($p);
        $r=sql::inner('uid,title,category,excerpt,content,date_format(lastup,"%d/%m/%Y") as up','cats','posts','catid','a',['b2.id'=>$a],0);
        $r['date']=$r['up'];//day()
        $r['author']=sql::read('name','users','v',['id'=>$r['uid']]);
        $r['tracks']=tracks::call($p);
        $r['editbt']='';
        if(auth(6) or $r['uid']==ses('uid'))
            $r['editbt']=bj(icovoc('edit','edit'),'main|posts,edit|a='.$a,'btn');
            //$r['editbt']=bj(icovoc('edit','edit'),'title,excerpt,content|posts,editcom|a='.$a,'btn');
            //$r['editbt']=btj(icovoc('edit','edit'),'editart',$a,'btn');
        $r['content']=conn::call(['msg'=>$r['content'],'m'=>0,'id'=>$a]);
        $ret=view::call('blocks/post',$r);
        return $ret;
    }

    static function stream($p){
        [$a,$b]=vals($p,['a','b']);
        $ret=div(bj(icovoc('gosearch','search','react'),'main|post,engine||inp','btsav').' '.input('inp','',14),'right');
        $ret.=h3(voc('posts_title'));
        $sq=['pub'=>1];
        if($a)$sq['category']=$a;
        $r=sql::inner('b2.id,uid,title,category,excerpt,date_format(b2.up,"%d/%m/%Y") as up','cats','posts','catid','ra',$sq);
        $ret.=div(count($r).' '.voc('posts_nb_title'),'block-inline');
        if(auth(4))$ret.=div(bh(icovoc('plus','create_bt','react'),'create'),'block-inline');
        foreach($r as $k=>$v){
            //$r[$k]['title']=bh($v['title'],'post/'.$v['id']);
            $r[$k]['date']=$v['up'];
            //$r[$k]['author']=sql::read('name','users','v',['id'=>$v['uid']]);
            $r[$k]['author']=sql::read('surname','profile2','v',['uid'=>$v['uid']]);
            //$r[$k]['category']=bh(icovoc('folder',$v['category']),'posts/'.$v['category']);
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