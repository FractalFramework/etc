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

    static function bt($id,$pub,$b='posts'){
        return span(admin::switchbt($id,$pub,$b),'',$b.'pub'.$id);
    }

    static function waiting($b){
        if($b=='tracks')$cnt='txt'; else $cnt='excerpt';
        $r=sql::inner('b2.id,name,'.$cnt.',pub','users',$b,'uid','ra',['_order'=>'b2.id desc']);
        foreach($r as $k=>$v){
            $r[$k]['id']=bh($v['id'],'post/'.$v['id'],'btn');
            $r[$k]['pub']=self::bt($v['id'],$v['pub'],$b);}
        return tabler($r,['id','author',$cnt,'pub']);
    }

    static function jsonfiles(){
        $dr='public/json';
        $r=scandir_r($dr);
        foreach($r as $k=>$v){
            $vb=str_replace([$dr.'/','.json'],'',$v);
            $rt[]=bj($vb,'jmnu|json,edit|a='.$vb);}
        return join('',$rt);
    }

    static function call($p){
        if(!auth(6))return div(voc('forbiden'),'frame-red');
        $rt[voc('tracks')]=h2(voc('tracks_moderation')).div(self::waiting('tracks'));
        $rt[voc('posts')]=h2(voc('posts_moderation')).div(self::waiting('posts'));
        $rt[voc('contacts')]=h2(voc('contacts')).div(contact::read($p));
        $rt['json']=h2('json').div(self::jsonfiles(),'menu').div('','','jmnu');
        return tabs($rt);
    }
}