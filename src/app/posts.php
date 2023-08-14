<?php
class posts{

    static function edit($p){
        [$a,$b]=vals($p,['a','b']);
        $r=sql::read('id,title,category,excerpt,content,date','posts','a',['id'=>$a]);
        $r['date']=date('ymd',strtotime($r['date']));
        $r['name']=sql::read('name','users','v',['id'=>$a]);
        $ret=view::call('blocks/post',$r);
        return $ret;
    }

    static function create($p){
        [$a,$b]=vals($p,['a','b']);
        $ret=h3(voc('new_post'));
        $r=sql::read('distinct(category)','posts','rv',[]);
        //$ret.=div(select('cat',$r,'pubmlic').label('cat',voc('category'),'btn'));
        $ret.=div(datalist('cat',$r,'public',12,'').label('cat',voc('category'),'btn'));
        $ret.=div(label('tit',voc('title'),'btn'));
        $ret.=div(input('tit','',64));
        $ret.=div(label('exc',voc('excerpt'),'btn'));
        $ret.=div(textarea('exc','',64,2));
        $ret.=div(label('msg',voc('message'),'btn'));
        $ret.=div(textarea('msg','',64,12));
        $ret.=bj(voc('send'),'tgmail|blocks,contactsave||name,mail,msg',['class'=>'btsav']);
        $ret.=div('','','tgmail');
        return $ret;
    }

    static function read($p){
        [$a,$b]=vals($p,['a','b']);
        $r=sql::read('id,title,category,excerpt,content,date','posts','a',['id'=>$a]);
        $r['date']=date('ymd',strtotime($r['date']));
        $r['name']=sql::read('name','users','v',['id'=>$a]);
        $ret=view::call('blocks/post',$r);
        return $ret;
    }

    static function call($p){
        [$a,$b]=vals($p,['a','b']);
        $ret=h3(voc('posts'));
        $sq=['pub'=>1];
        if($b)$sq['category']=$b;
        $r=sql::read('id,uid,title,category,excerpt,date','posts','ar',$sq);
        foreach($r as $k=>$v){
            $r[$k]['bt_title']=bh($v['title'],'post/'.$v['id']);
            $r[$k]['name']=sql::read('name','users','v',['id'=>$v['uid']]);}
        foreach($r as $k=>$v)$ret.=view::call('blocks/posts',$v);
        return $ret;
    }

}