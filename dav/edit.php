<?php
class edit{

    static function save($p){
        $b=$p['b']??'';
        $no=secur::call(__CLASS__,__FUNCTION__);
        if($no && $b!='tracks')return $no;//derogation
        $ra=db::cols_k($b);
        $rb=valk($p,$ra);
        return sql::sav($b,$rb);}

    static function update($p){
        [$b,$id]=vals($p,['b','id']); 
        $no=secur::call(__CLASS__,__FUNCTION__);
        if($no)return $no;
        $ra=db::cols_k($b);
        $rb=valk($p,$ra); pr($rb);
        return sql::upd($b,$rb,$id);}

    static function read($p){
        [$b,$id]=vals($p,['b','id']);
        if(!$id)return er('no');
        if($id)$r=sql::read('all',$b,'a',$id);
        return tabler($r,1,1);}

    static function lk($d){
        return bh($d,'edit/'.$d);}

    static function list(){$rt=[];
        $r=sql::call('show tables','rv');
        $rt=walk($r,'edit::lk');
        $ret=join('',$rt);
        return div($ret,'menu');}
    
    static function call($p){
        [$a,$b,$c]=vals($p,['a','b','c']); $rid=rid($a); $r=[]; $sav='';
        if($b=='add')$sav=1; if(!is_numeric($b))$b='';
        if(!$a)return self::list();
        if($a && $b)$r=sql::read('all',$a,'a',$b);
        $ra=db::cols_r($a);
        $keys=implode(',',array_keys($ra));
        if($b)$com='update'; elseif($sav)$com='save'; else $com='read';
        $ret=bj(voc('save'),$rid.'|edit,'.$com.'|b='.$a.',id='.$b.'|'.$keys,'btsav');
        $ret.=form::call($ra,$r);
        return div($ret,'',$rid);}
    
}