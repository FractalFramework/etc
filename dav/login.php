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

    static function response($p){
        [$a,$b]=vals($p,['mail','pswd']);
        $ex_name=sql::read('id','users','v',['name'=>$a]);
        $ex_pswd=sql::read('id','users','v',['name'=>$a,'pswd'=>'password('.$b.')']);
        if($ex_pswd){
            self::auth($ex_pswd);
            $ret=div(voc('loged'),'frame-green');
        }
        elseif($ex_name){
            $ret=div(voc('bad_password'),'frame-red');
            $ret.=div(bh(voc('redo'),'login',['class'=>'btn']));
            $ret.=hidden('mail',$a);
            $ret.=div(input('pswd',$b,'',['type'=>'password']).label('name',voc('password'),'btn'));
            $ret.=bj(voc('go'),'content|login,call||mail,pswd',['class'=>'btsav']);
        }
        else{
            $ret=div(voc('inexistant_user'),'frame-red');
            $ret.=div(bh(voc('go'),'login',['class'=>'btn']));
            $ret.=hidden('mail',$a).hidden('pswd',$b);
            $ret.=div(input('name','').label('name',voc('name'),'btn'));
            $ret.=bj(voc('register?'),'tgreg|login,register||name,mail,pswd',['class'=>'btsav']);
            $ret.=div('','','tgreg');
        }
        return $ret;
    }

    static function form($p){
        [$a,$b]=vals($p,['a','b']);
        $ret=h3(voc('login'));
        $ret.=bj(voc('go'),'content|login,call||mail,pswd',['class'=>'btsav']);
        $ret.=div(input('mail',$a,'',['type'=>'mail']).label('mail',voc('mail'),'btn'));
        $ret.=div(input('pswd',$b,'',['type'=>'password']).label('name',voc('password'),'btn'));
        return $ret;
    }
    
    static function auth($id=''){
        if(!$id)$id=1;//assume first user
        $r=sql::read('id,name,auth,slogan,logo','users','a',$id);
        if(!$r)return;
        ses('uid',$r['id']);
        ses('usr',$r['name']);
        ses('auth',$r['auth']);
        ses::$r['usr']=$r;
        cookie('uid',$r['id']);
        //ses::usr('name');
    }
    
    static function logout(){
        sesz('usr');
        sesz('uid');
        setcookie('uid','',0);
        echo cookie('uid');
        //echo ses('uid');
        return div(voc('loged_out'),'frame-white');
    }
    
    static function loged(){
        $ret=div(voc('hello').' '.ses('usr'),'frame-blue');
        $ret.=div(bj(voc('logout'),'content|login,logout',['class'=>'btn']));
        return $ret;
    }
    
    static function recognize(){
        $uid=cookie('uid');
        if($uid)self::auth($uid);
    }

    static function call($p){
        [$a,$b]=vals($p,['mail','pswd']);
        if(ses('uid'))$ret=self::loged($p);
        elseif($a && $b)$ret=self::response($p);
        else $ret=self::form($p);
        return $ret;
    }

}