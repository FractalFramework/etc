<?php
class login{

    static function register($p){$e='';
        [$a,$b,$c]=vals($p,['name','mail','pswd']);
        if($a && $b && $c)
        //$e=sql::qr('insert into users value (null,"'.$a.'","1","'.$b.'",passord("'.$c.'"),"","")',1);
        $e=sql::sav('users',[$a,'1',$b,'passord('.$c.')','','']);
        if($e)$ret=div(voc('registered'),'frame-blue');
        else $ret=div(voc('notregistered'),'frame-red');
        return $ret;
    }

    static function form($p){
        [$a,$b]=vals($p,['a','b']);
        $ret=h3(voc('login'));
        $ret.=bj(voc('go'),'content|login,call||mail,pswd','btsav');
        $ret.=div(inpmail('mail',$a).label('mail',voc('knownmail'),'btn'));
        $ret.=div(inpsw('pswd',$b).label('name',voc('password'),'btn'));
        return $ret;
    }

    static function response($p){
        [$a,$b]=vals($p,['mail','pswd']);
        $uid=sql::read('id','users','v',['mail'=>$a]);
        $ok=sql::call('select id from users where name="'.$a.'" and pswd=password("'.$b.'")','v');
        if($ok){
            self::auth($uid);
            $ret=div(voc('loged'),'frame-green');
        }
        elseif($uid){
            $ret=div(voc('bad_password'),'frame-blue');
            $ret.=div(bh(voc('redo'),'login','btn'));
            $ret.=hidden('mail',$a);
            $ret.=div(input('pswd',$b,'',['type'=>'password']).label('name',voc('password'),'btn'));
            $ret.=bj(voc('go'),'content|login,call||mail,pswd','btsav');
        }
        else{
            $ret=div(voc('inexistant_user'),'frame-red');
            $ret.=div(bh(voc('go'),'login','btn'));
            $ret.=hidden('mail',$a).hidden('pswd',$b);
            $ret.=div(input('name','').label('name',voc('name'),'btn'));
            $ret.=bj(voc('register?'),'tgreg|login,register||name,mail,pswd',['class'=>'btsav']);
            $ret.=div('','','tgreg');
        }
        return $ret;
    }
    
    static function auth($id=''){
        if(!$id)$id=1;//assume first user
        $r=sql::read('id,name,auth','users','a',$id);
        //$r=sql::inner('uid,name,auth,slogan,logo','profile','users','uid','ra',$id); pr($r);
        if(!$r)return;
        ses('uid',$r['id']);
        ses('usr',$r['name']);
        ses('auth',$r['auth']);
        //auth(6);
        ses::$r['usr']=$r;
        cookie('uid',$r['id']);
        //ses::usr('name');
    }
    
    static function recognize(){//called from boot
        $uid=cookie('uid');
        if($uid)self::auth($uid);
    }
    
    static function logout(){
        sesz('usr');
        sesz('uid');
        sesz('auth');
        setcookie('uid','',0);
        //cookie('uid',0);
        return div(voc('loged_out'),'frame-white');
    }
    
    static function loged(){
        $ret=div(voc('hello').' '.ses('usr'),'frame-blue');
        $ret.=div(bj(voc('logout'),'content|login,logout','btn'));
        return $ret;
    }

    static function call($p){
        [$a,$b]=vals($p,['mail','pswd']);
        if(ses('uid'))$ret=self::loged();
        elseif($a && $b)$ret=self::response($p);
        else $ret=self::form($p);
        return $ret;
    }

}