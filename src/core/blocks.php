<?php
class blocks{

    static $defaults=['surname'=>'etc','slogan'=>'...','banner'=>'','logo'=>''];

    static function banner($p){
        [$a,$b]=vals($p,['a','b']);
        $id=ses('uid'); if(!$id)$id=cnfg('usrhome');
        $r=sql::read('surname,slogan,banner,logo','profile2','a',$id);
        if(!$r)$r=self::$defaults;
		if(isimg($r['banner']??''))$r['banner']='url(/img/'.$r['banner'].')';
        $ret=view::call('blocks/banner',$r);
        return $ret;
    }

    static function footer($p){
        $ret=div('etc@2023');
        //$ret.=div(lk('https://github.com/FractalFramework/etc','i want the same'),'small');
        $ret.=div('Tous droits réservés','small');
        return $ret;
    }
    
    static function user(){
        $ret=edit::call(['a'=>'profile2','b'=>'play','c'=>ses('uid')]);
        $ret.=edit::call(['a'=>'socials','b'=>'play','c'=>'']);
        return $ret;
    }
    
    static function socials(){$ret='';
        $r=sql::read('url','socials','a',['uid'=>ses('uid')]);
        foreach($r as $k=>$v)$ret.=li(lk($v));
        return tag('ul',[],$ret);
    }

    static function nav($p){$rb=[];
        $rb[]=bh(icovoc('home','home_bt','react'),'home');
        //$r=sql::read('distinct(catid)','posts','w',['pub'=>1]);
        //$r=sql::inner('distinct(category)','cats','posts','catid','rv','where pub>0');
        //foreach($r as $k=>$v)$rb[]=bh(icovoc('folder',$v),'posts/'.$v);
        $rb[]=bh(icovoc('folder','articles','react'),'posts');
        $rb[]=bh(icovoc('mail','contact_bt','react'),'contact');
        //$rb[]=bh(icovoc('search','search_bt','react'),'search');
        //$rb[]=bj(icovoc('search','search','react').' '.input('inp','',8),'main|post,engine||inp','btsav');
        if(auth(4))$rb[]=bh(icovoc('plus','create_bt','react'),'create');
        $rb[]=div('','line');
        $rb[]=bh(icovoc('login','login_bt','react'),'login');
        if(auth(1))$rb[]=bh(icovoc('user','user_bt','react'),'user');
        if(auth(6))$rb[]=bh(icovoc('admin','admin_bt','react'),'admin');
        $rc['menu']=div(join('',$rb));
        $ret=view::call('blocks/nav',$rc);
        return $ret;
    }

    static function forbidden(){
        return div(voc('forbiden_access'),'frame-red');
    }

    static function call($p){
        [$a,$b,$c,$d]=vals($p,['a','b','c','d']);
        if($a=='main')$a=get('a');//root for main
        $p=['a'=>$b,'b'=>$c,'c'=>$d];//join ajax cmd
        if(method_exists('blocks',$a))return self::$a($p);
        if(method_exists($a,'call'))return $a::call($p);
        return match($a){
            'post'=>posts::read($p),
            'create'=>auth(4)?posts::create($p):self::forbidden(),
            'edit'=>auth(4)?posts::edit($p):self::forbidden(),
            'home'=>posts::call($p),
            default=>posts::call($p),
        };
    }

}