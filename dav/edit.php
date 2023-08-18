<?php
class edit{

    static function save($p){
        $b=$p['b']??'';
        $no=secur::call(__CLASS__,__FUNCTION__);
        if($no && $b!='tracks')return $no;//derogation
        $ra=db::cols_k($b);
        $rd=walk($ra,'unid');
        $rb=vals($p,$rd);
        $rt=array_combine($ra,$rb);
        return sql::sav($b,$rt,1);}

    static function update($p){
        [$b,$id]=vals($p,['b','id']); 
        $no=secur::call(__CLASS__,__FUNCTION__);
        if($no)return $no;
        $ra=db::cols_k($b);
        $rd=walk($ra,'unid');
        $rb=vals($p,$rd);
        $rt=array_combine($ra,$rb);
        return sql::upd($b,$rt,$id);}

    static function read($p){$r=[];
        [$b,$id]=vals($p,['b','id']);
        if(!$id)return er('no');
        //$cl=db::cols_s($b);
        if($id)$r=sql::read('all',$b,'a',$id); //pr($r);
        return tabler($r);}
    
    static function lk($d){
        return bh($d,'edit/'.$d);}

    static function list(){$rt=[];
        $r=sql::call('show tables','rv');
        $rt=walk($r,'edit::lk');
        $ret=join('',$rt);
        return div($ret,'menu');}
    
    static function call($p){//pr($p);
        [$a,$b,$c]=vals($p,['a','b','c']); $rid=rid($a); $r=[]; $ret=''; $sav='';
        if($b=='read' && $c)return self::read(['b'=>$a,'id'=>$c]);
        if($b=='add')$sav=1; if(!is_numeric($b))$b='';
        if(!$a)return self::list();
        $ra=db::cols_r($a);
        if($a && $b && $ra)$r=sql::read('all',$a,'a',$b,0);
        $keys=implode(',',walk(array_keys($ra),'unid'));
        if($b)$com='update'; elseif($sav)$com='save'; else $com='read';
        if($ra)$ret=bj(voc('save'),$rid.'|edit,'.$com.'|b='.$a.',id='.$b.'|'.$keys,'btsav');
        if($com!='read')$ret.=form::call($ra,$r);
        return $ret.div($ret,'',$rid);}
    
}