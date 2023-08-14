<?php
class blocks{

    static $rb=[];

    static function banner($p){
        [$a,$b]=vals($p,['a','b']);
        $id=ses('uid'); if(!$id)$id=cnfg('usrhome');
        $r=sql::read('name,slogan,logo','users','a',$id);
        $ret=view::call('blocks/banner',$r);
        return $ret;
    }

    static function menu($p){$rb=[];
        //$rb[]=bj('home','wrapper|blocks,content');
        $rb[]=bh(ico('home').' '.'home','home');
        $r=sql::read('distinct(category)','posts','w',['pub'=>1]);
        foreach($r as $k=>$v)$rb[]=bh(ico('folder').' '.$v,'posts/'.$v);
        $rb[]=bh(ico('mail').' '.'contact','contact');
        $rb[]=bh(ico('search').' '.'search','search');
        $rb[]=bh(ico('login').' '.'login','login');
        if(auth(6))$rb[]=bh(ico('plus').' '.'add','create');
        $rc['menu']=div(join('',$rb),'menu');
        $ret=view::call('blocks/menu',$rc);
        return $ret;
    }

    static function footer($p){
        [$a,$b]=vals($p,['a','b']);
        $r['footer']='dav@2023';
        $ret=view::call('blocks/footer',$r);
        return $ret;
    }

    static function call($p){
        [$a,$b,$c]=vals($p,['a','b','c']);
        $p=['a'=>$b,'b'=>$c];//join ajax cmd
        if(method_exists('blocks',$a))return self::$a($p);
        if(method_exists($a,'call'))return $a::call($p);
        return match($a){//todo:resolve blocks in #body
            'home'=>posts::call($p),
            'create'=>posts::create($p),
            default=>posts::call($p),
        };
    }

}