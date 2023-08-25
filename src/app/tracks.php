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

    static function save($p){
        [$a,$b]=vals($p,['bid','msg']);
        $x=sql::sav('tracks',[ses('uid'),$a,$b,0],0);
        if($x)return div(voc('pending_track'),'frame-green');
        else return div(voc('already_said'),'frame-red');
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
            $r[$k]['date']=day('ymd',$v['up']);
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
        if(ses('uid'))$r['let_track']=bjtog(icovoc('asterix','let_track'),'track_form|tracks,form|a='.$a);
        else $r['let_track']=bh(voc('need_auth'),'login');
        $r['tracks']=self::stream($p);
        $ret=view::call('blocks/tracks',$r);
        return $ret;
    }
}