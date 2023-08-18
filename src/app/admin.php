<?php
class admin{

    static function pub($p){
        [$id,$b]=vals($p,['id','b']);
        $pub=sql::read('pub','tracks','v',['id'=>$id]);
        $pub2=$pub?0:1;
        sql::upd('tracks',['pub'=>$pub2],['id'=>$id]);
        return self::switchbt($id,$pub2,$b);
    }

    static function switchbt($id,$pub,$b){
        $bt=$pub?voc('on'):voc('off');
        $c=$pub?'btsav':'btdel';
        $ret=bj($bt,$b.$id.'|admin,pub|id='.$id.',b='.$b,$c);
        return $ret;
    }

    static function waiting($b){
        if($b=='tracks')$cols='b2.id,name,txt,pub';
        else $cols='b2.id,name,content,pub';
        $r=sql::inner($cols,'users',$b,'uid','ra',['_order'=>'pub asc']);
        foreach($r as $k=>$v){
            $r[$k]['id']=bh($v['id'],'post/'.$v['id'],'btn');
            $r[$k]['pub']=div(self::switchbt($v['id'],$v['pub'],$b),'',$b.$v['id']);
        }
        return tabler($r,['id','author','txt','pub']);
    }

    static function call($p){
        if(!auth(6))return div(voc('forbiden'),'frame-red');
        $ret=h2(voc('tracks_moderation'));
        $ret.=div(self::waiting('tracks'));
        $ret.=h2(voc('posts_moderation'));
        $ret.=div(self::waiting('posts'));
        return $ret;
    }
}