<?php
class conn{

static function cprm($d){$n=mb_strrpos($d,'|'); if($n===false)$n=mb_strrpos($d,'§');
    if($n===false)return [$d,'']; else return [mb_substr($d,0,$n),mb_substr($d,$n+1)];}
    
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

static function connectors($da,$rp=[]){
$c=''; $p=''; $o=''; $ret=''; $no=ishtml($da); $ht=ishttp($da);
$cp=strrpos($da,':',$ht?7:0); if($cp!==false){$c=substr($da,$cp+1); $d=substr($da,0,$cp);} else $d=$da;
$cp=strrpos($da,'|'); if($cp!==false){$o=substr($d,$cp+1); $p=substr($d,0,$cp);} else $p=$d;
//echo 'da='.$da.'-p='.$p.'-o='.$o.'-c='.$c.br();
if(isimg($p) && !$no)return tagb('figure',img(imgroot($p)).($o?tagb('figcaption',$o):''));
if(strpos($da,'://') && !$no){$o=conns::socialk($p,$o); return lk($p,$o);}
if(method_exists('conns',$c))return conns::$c($p,$o);
if($c)$ret=match($c){
    'b'=>'<b>'.$d.'</b>',
    'i'=>'<i>'.$d.'</i>',
    'u'=>'<u>'.$d.'</u>',
    'h'=>'<big>'.$d.'</big>',
    'e'=>'<sup>'.$d.'</sup>',
    'n'=>'<sub>'.$d.'</sub>',
    's'=>'<small>'.$d.'</small>',
    'k'=>'<del>'.$d.'</del>',
    'q'=>'<blockquote>'.$d.'</blockquote>',
    'qu'=>'<q>'.$d.'</q>',
    'clr'=>tag('span',['style'=>'color:'.($o?$o:'red')],$p),
    'bkg'=>tag('span',['style'=>'background-color:'.($o?$o:'yellow')],$p),
    'anchor'=>tag('a',['name'=>$o],$d),
    //'read'=>conns::read($p,$o),
    //'list'=>conns::list($p,$o),
    'ko'=>tagb('pre',$da),
    'no'=>'',
    //default=>tag($c,[],$d)
    default=>''};
if($ret)$da=$ret;
return $da;}

static function call($p){
[$d,$m,$id]=vals($p,['msg','m','id']);
$d=self::parser($d,[$m,$id]);
$d=self::embed_p($d);
$d=nl2br($d);
return $d;}
}