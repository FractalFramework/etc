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
        $rb[]=bh(ico('home').' '.voc('home_bt'),'home');
        //$r=sql::read('distinct(catid)','posts','w',['pub'=>1]);
        $r=sql::inner('distinct(category)','cats','posts','catid','w',['>pub'=>'0']);
        foreach($r as $k=>$v)$rb[]=bh(ico('folder').' '.$v,'posts/'.$v);
        $rb[]=bh(ico('mail').' '.voc('contact_bt'),'contact');
        $rb[]=bh(ico('search').' '.voc('search_bt'),'search');
        $rb[]=bh(ico('login').' '.voc('login_bt'),'login');
        if(auth(4))$rb[]=bh(ico('plus').' '.voc('create_bt'),'create');
        if(auth(1))$rb[]=bh(ico('user').' '.voc('user_bt'),'user');
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

    static function forbidden(){
        return div(voc('forbiden_access'),'frame-red');
    }

    static function call($p){
        [$a,$b,$c]=vals($p,['a','b','c']);
        if($a=='content')$a=get('a');//bricolage
        $p=['a'=>$b,'b'=>$c];//join ajax cmd
        if(method_exists('blocks',$a))return self::$a($p);
        if(method_exists($a,'call'))return $a::call($p);
        return match($a){//todo:resolve blocks in #body
            'home'=>posts::call($p),
            'post'=>posts::read($p),
            'create'=>auth(4)?posts::form($p):self::forbidden(),
            default=>posts::call($p),
        };
    }

}