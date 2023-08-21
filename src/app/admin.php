<?php
class admin{

    static function pub($p){
        [$id,$b]=vals($p,['id','b']);
        $pub=sql::read('pub',$b,'v',['id'=>$id]);
        $pub2=$pub?0:1;
        sql::upd($b,['pub'=>$pub2],['id'=>$id]);
        return self::switchbt($id,$pub2,$b);
    }

    static function switchbt($id,$pub,$b){
        $bt=$pub?voc('on'):voc('off');
        $c=$pub?'btsav':'btdel';
        $ret=bj($bt,$b.'pub'.$id.'|admin,pub|id='.$id.',b='.$b,$c);
        return $ret;
    }

    static function waiting($b){
        if($b=='tracks')$cnt='txt'; else $cnt='excerpt';
        $r=sql::inner('b2.id,name,'.$cnt.',pub','users',$b,'uid','ra',['_order'=>'pub asc']);
        foreach($r as $k=>$v){
            $r[$k]['id']=bh($v['id'],'post/'.$v['id'],'btn');
            $r[$k]['pub']=div(self::switchbt($v['id'],$v['pub'],$b),'',$b.'pub'.$v['id']);
        }
        return tabler($r,['id','author',$cnt,'pub']);
    }

    static function call($p){
        if(!auth(6))return div(voc('forbiden'),'frame-red');
        $rt[voc('tracks')]=h2(voc('tracks_moderation')).div(self::waiting('tracks'));
        $rt[voc('posts')]=h2(voc('posts_moderation')).div(self::waiting('posts'));
        $rt[voc('contacts')]=h2(voc('contacts')).div(contact::read($p));
        return tabs($rt);
    }
}