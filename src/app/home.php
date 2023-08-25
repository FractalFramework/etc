<?php
class home{

    static function presentation($p){
        $r=sql::inner('name,surname,mail,slogan,logo','users','profile2','uid','a',['b1.id'=>ses('uid')]);
        $ret=h1($r['surname']);
        $ret.=h2($r['slogan']);
        $ret.=isimg($r['logo'])?img('/img/'.$r['logo'],['width'=>'180px']):ico('img');
        return $ret;
    }

    static function socials($p){$ret='';
        $r=sql::read('url','socials','rv',['uid'=>ses('uid')]);
        foreach($r as $k=>$v)$ret.=tag('li',[],lk(conn::socialk($v,$v),$v));
        return tag('ul',[],$ret);
    }

    static function call($p){
        $r['presentation']=self::presentation($p);
        $r['socials']=self::socials($p);
        $ret=view::call('blocks/home',$r);
        return $ret;
    }
}