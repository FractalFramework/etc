<?php
class conn{
static $nl='';
    
static function parser($d,$p=[]){
    $a='';$b='';$c=''; if(!$d)return'';//
    $op='['; $cl=']'; $in=strpos($d,$op);
    if($in!==false){$a=substr($d,0,$in);
        $out=strpos(substr($d,$in+1),$cl);
        if($out!==false){$bb=substr($d,$in+1,$out);
            $n=substr_count($bb,$op);
            if($n>=1){
                for($i=1;$i<=$n;$i++){$tmp=$in+1+$out+1;
                    $out+=strpos(substr($d,$tmp),$cl)+1;
                    $n=substr_count(substr($d,$in+1,$out),$op);}
                $b=substr($d,$in+1,$out);
                $b=self::parser($b,$p);}
            else $b=$bb;
            $b=self::connectors($b,$p);
            $c=substr($d,$in+1+$out+1);
            $c=self::parser($c,$p);}
        else $c=substr($d,$in+1);}
    else $c=$d;
    return $a.$b.$c;}

    static function embed_p($d){
    $d=str_replace("\n\n</","</",$d); $r=explode("\n\n",$d); $ret='';
    $ex='<h1<h2<h3<h4<h5<br<hr<bl<pr<di<if<fi';//<ob<sv<sp<bi<li<im<ta<ol<ul
    foreach($r as $k=>$v){if($v=trim($v)){$cn=substr($v,0,3);
        if(strpos($ex,$cn)!==false)$ret.=$v; else $ret.='<p>'.$v.'</p>';}}
    return $ret;}

    static function connectors($da,$p=[]){
        $cp=strrpos($da,':'); $c=substr($da,$cp); $d=substr($da,0,$cp);
        return tag($c,[],$d);
    }

    static function call($p){
        [$d,$m,$id,$nl]=vals($p,['msg','m','id','nl']);
        self::$nl=$nl;
        $d=self::parser($d,[$m,$id,$nl]);
        $d=self::embed_p($d);
        $d=nl2br($d);
        return $d;}
}