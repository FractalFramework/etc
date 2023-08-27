<?php
class conns{
    //edit
    static function bt($p){
        $r=json::call('lang/conn'); $id=$p['id']??'';
        $rt[]=btj('[ ]','embed',['[',']',$id]);
        foreach($r as $k=>$v){[$t,$o,$a]=arr($v,3); if($o)$o='|'.$o;
            if($a)$rt[]=btj($k,'embed',['[',$o.':'.$k.']',$id],'',['title'=>$t]);}
        if($p['bt'])$rt[]=btj(ico('save'),'editbt',['content',$id],'btsav',['id'=>'bt'.$id,'rel'=>'1']);
        return div(join('',$rt),'menu');}

    //builders
    static function socialk($u,$d=''){
        $r=['','twitter','youtube','facebook','linkedin','instagram'];
        $k=in_array_k($u,$r);
        if($k)$d=img('/img/socials/'.$r[$k].'.png','20px').' '.($d?$d:domain($u));
        return $d;}
    
    static function list($p,$o=''){
        $r=explode("\n",$p);
        return mkli($r,$o?'ol':'ul');}
    
    //conns
    static function art($id,$t=''){
        if(!$t)$t=sql::read('title','posts','v',$id);
        return bh(ico('url').thin().$t,'post/'.$id,'btn');}
    
    static function read($id,$o=''){$d='';
        if(!$o)$d=posts::content(['id'=>$id]);
        $t=sql::read('title','posts','v',$id);
        $ret=h3(bjtog($t,'cnt'.$id.'|conns,read_content|id='.$id,!$o?'active':''));
        $ret.=div($d,'','cnt'.$id);
        return $ret;}

    //apps
    static function profile($id,$o=''){
        $r=sql::inner('name,surname,mail,slogan,logo','users','profile2','uid','a',['b1.id'=>ses('uid')]);
        $ret=h2($r['surname']);
        $ret.=h3($r['slogan']); 
        $f=imgroot($r['logo']);
        if(isimg($r['logo']))$ret.=img($f,'180px');
        return $ret;}

    static function socials($id,$o=''){$rt=[];
        $r=sql::read('url','socials','rv',['uid'=>ses('uid')]);
        foreach($r as $k=>$v)$rt[]=self::socialk($v);
        return rdiv($rt);}
}