<?php
class blocks{

    static $defaults=['surname'=>'etc','slogan'=>'...','banner'=>'','logo'=>''];

    static function banner($p){
        [$a,$b]=vals($p,['a','b']);
        $id=ses('uid'); if(!$id)$id=cnfg('usrhome');
        $r=sql::read('surname,slogan,banner,logo','profile2','a',$id);
        if(!$r)$r=self::$defaults;
		if(is_img($r['banner']??''))$r['banner']='url(/img/'.$r['banner'].')';
        $ret=view::call('blocks/banner',$r);
        return $ret;
    }

    static function nav($p){$rb=[];
        //$rb[]=bj('home','wrapper|blocks,content');
        $rb[]=bh(icovoc('home','home_bt','react'),'home');
        //$r=sql::read('distinct(catid)','posts','w',['pub'=>1]);
        //$r=sql::inner('distinct(category)','cats','posts','catid','rv','where pub>0');
        //foreach($r as $k=>$v)$rb[]=bh(icovoc('folder',$v),'posts/'.$v);
        $rb[]=bh(icovoc('folder','articles','react'),'posts');
        $rb[]=bh(icovoc('mail','contact_bt','react'),'contact');
        $rb[]=bh(icovoc('search','search_bt','react'),'search');
        if(auth(4))$rb[]=bh(icovoc('plus','create_bt','react'),'create');
        $rb[]=div('','line');
        $rb[]=bh(icovoc('login','login_bt','react'),'login');
        if(auth(1))$rb[]=bh(icovoc('user','user_bt','react'),'user');
        if(auth(6))$rb[]=bh(icovoc('admin','admin_bt','react'),'admin');
        $rc['menu']=div(join('',$rb));
        $ret=view::call('blocks/nav',$rc);
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
        [$a,$b,$c,$d]=vals($p,['a','b','c','d']);
        if($a=='content')$a=get('a');//bricolage
        $p=['a'=>$b,'b'=>$c,'c'=>$d];//join ajax cmd
        if(method_exists('blocks',$a))return self::$a($p);
        if(method_exists($a,'call'))return $a::call($p);
        return match($a){//todo:resolve blocks in #body
            'post'=>posts::read($p),
            'create'=>auth(4)?posts::form($p):self::forbidden(),
            'edit'=>auth(4)?posts::edit($p):self::forbidden(),
            'home'=>posts::call($p),
            default=>posts::call($p),
        };
    }

}