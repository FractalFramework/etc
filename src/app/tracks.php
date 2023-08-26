<?php
class tracks{

    static function edit($p){
        [$a,$b]=vals($p,['a','b']);
        $r=sql::read('id,title,category,excerpt,content,date','posts','a',['id'=>$a]);
        $r['date']=date('ymd',strtotime($r['date']));
        $r['name']=sql::read('name','users','v',['id'=>$a]);
        $ret=view::call('blocks/post',$r);
        return $ret;
    }

    static function save($p){$uid=ses('uid'); $psw='';
        [$a,$b,$c,$d]=vals($p,['bid','msg','name','mail']);
        if($c && $d)$psw=unid(time());
        if($c && $d)$uid=login::fastsave(['name'=>$c,'mail'=>$d,'pswd'=>$psw]);
        $x=sql::sav('tracks',[$uid,$a,$b,0],0);
        $back=bh(icovoc('back'),'post/'.$a,'btn');
        if($x)$ret=div(voc('pending_track').' '.$back,'frame-green');
        else $ret=div(voc('already_said').' '.$back,'frame-red');
        if($psw)$ret.=div(voc('new_password').' '.tagb('pre',$psw),'frame-blue');
        return $ret;
    }

    static function form($p){
        [$a,$b]=vals($p,['a','b']);
        $ret=h3(voc('new_track'));
        $ret.=div(label('msg',voc('message'),'btn'));
        $ret.=div(textarea('msg','',64,12));
        $ret.=hidden('bid',$a);
        $ret.=bj(voc('send'),'track_form|tracks,save||bid,msg','btsav');//tgtrk
        //$ret.=div('','','tgtrk');
        return $ret;
    }

    static function miniform($a){
        $ret=bj(voc('send'),'track_form|tracks,save||bid,msg,name,mail','btsav');
        //$ret.=div(textarea('msg','',64,12));
        if(!auth(8))$ret.=input('name','','',['placeholder'=>'name']).inpmail('mail','');
        else $ret.=hidden('name','').hidden('mail','');
        $ret.=divarea('msg','','track-content');
        $ret.=hidden('bid',$a);
        return $ret;
    }

    static function read($p){
        [$a,$b]=vals($p,['a','b']);
        $r=sql::inner('b2.id,name,txt,b2.up','users','tracks','uid','ra',['id'=>$a]);
        $r['date']=date('ymd',strtotime($r['date']));
        $ret=view::call('blocks/track',$r);
        return $ret;
    }

    static function stream($p){
        $ret='';
        [$a,$b]=vals($p,['a','b']);
        $pbs=['1']; if(auth(4))$pbs[]='0';
        $sq=['bid'=>$a,'pub('=>$pbs];
        $r=sql::inner('b2.id,name,txt,pub,date_format(b2.up,"%d/%m/%Y") as up','users','tracks','uid','ra',$sq);
        if($r)foreach($r as $k=>$v){
            $r[$k]['date']=$v['up'];
            $r[$k]['editbt']=auth(4)?admin::bt($v['id'],$v['pub'],'tracks'):'';
            $ret.=view::call('blocks/track',$r[$k]);}
        else $ret=ico('comment');
        return $ret;
    }

    static function call($p){
        [$a,$b]=vals($p,['a','b']);
        $r['tracks_title']=voc('tracks_title');
        $r['tracks_nb']=sql::read('count(id)','tracks','v',['bid'=>$a,'pub'=>1]);
        $r['tracks_nb_title']=voc('tracks_nb_title');
        //if(ses('uid'))$r['track_form']=bjtog(icovoc('asterix','let_track'),'track_form|tracks,form|a='.$a);
        if(ses('uid'))$r['track_form']=self::miniform($a);
        else $r['track_form']=bh(voc('need_auth'),'login','frame-red');
        $r['tracks']=self::stream($p);
        $ret=view::call('blocks/tracks',$r);
        return $ret;
    }
}