<?php
class posts{

    static function edit($p){
        [$a,$b]=vals($p,['a','b']);
        $r=sql::read('id,title,category,excerpt,content,up','posts','a',['id'=>$a]);
        $r['date']=date('ymd',strtotime($r['up']));
        $r['author']=sql::read('name','users','v',['id'=>$a]);
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
        $ret.=bj(voc('send'),'tgmail|contact,save||name,mail,msg','btsav');
        $ret.=div('','','tgmail');
        return $ret;
    }

    static function read($p){
        [$a,$b]=vals($p,['a','b']);
        //$r=sql::read2('id,title,catid,excerpt,content,up','posts','a',['id'=>$a]);
        //$r['category']=sql::read('category','cats','v',['id'=>$r['catid']]);
        $r=sql::inner('uid,title,category,excerpt,date_format(b2.up,"%d/%m/%Y") as up','cats','posts','catid','a',['b2.id'=>$a],0);
        $r['date']=$r['up'];//day()
        $r['author']=sql::read('name','users','v',['id'=>$a]);
        $r['tracks']=tracks::call($p);
        $ret=view::call('blocks/post',$r);
        return $ret;
    }

    static function stream($p){
        [$a,$b]=vals($p,['a','b']);
        $ret=h3(voc('posts'));
        $sq=['pub'=>1];
        if($a)$sq['category']=$a;
        $r=sql::inner('b2.id,uid,title,category,excerpt,date_format(b2.up,"%d/%m/%Y") as up','cats','posts','catid','ra',$sq);
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