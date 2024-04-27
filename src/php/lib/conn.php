<?php
class conn{
static $cn=['b','i','u','h1','h2','h3','h4','small','big','pre','code'];
static $cb=['h'=>'big','k'=>'strike','q'=>'blockquote','s'=>'small','e'=>'sup','n'=>'sub','c'=>'center','qu'=>'q'];

static function cprm($d){$n=mb_strrpos($d,'|'); if($n===false)$n=mb_strrpos($d,'§');
if($n===false)return [$d,'']; else return [mb_substr($d,0,$n),mb_substr($d,$n+1)];}

static function poc($da){$c=''; $p=''; $o=''; $ht=str_contains($da,'://')?1:0; 
$cp=strrpos($da,':',$ht?7:0); if($cp!==false){$c=substr($da,$cp+1); $d=substr($da,0,$cp);} else $d=$da;
[$p,$o]=self::cprm($d);
return [$p,$o,$c,$d];}

static function parser($d,$p=[],$e='conn::connectors'){
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
            $b=self::parser($b,$p,$e);}
        else $b=$bb;
        $b=$e($b,$p);//connectors
        $c=substr($d,$in+1+$out+1);
        $c=self::parser($c,$p,$e);}
    else $c=substr($d,$in+1);}
else $c=$d;
return $a.$b.$c;}

static function embed_p($d){
$d=str_replace("\n\n</","</",$d); $r=explode("\n\n",$d); $ret='';
$ex='<h1<h2<h3<h4<h5<br<hr<bl<pr<di<if<fi';//<ob<sv<sp<bi<li<im<ta<ol<ul
foreach($r as $k=>$v){if($v=trim($v)){$cn=substr($v,0,3);
    if(strpos($ex,$cn)!==false)$ret.=$v; else $ret.='<p>'.$v.'</p>';}}
return $ret;}

static function markdown($da,$rp){
[$p,$o,$c,$d]=conn::poc($da);        
if($c)return match($c){
    'h1'=>'# '.$d,
    'h2'=>'## '.$d,
    'h3'=>'### '.$d,
    'h4'=>'#### '.$d,
    'i'=>'*'.$d.'*',
    'b'=>'**'.$d.'**',
    'k'=>'~~'.$d.'~~',
    'k'=>'> '.$d,
    'no'=>'',
    default=>''};}

static function connectors($da,$rp=[]){
[$p,$o,$c,$d]=self::poc($da); $ret=''; 
if($c)$ret=match($c){
    'clr'=>tag('span',['style'=>'color:'.($o?$o:'red')],$p),
    'bkg'=>tag('span',['style'=>'background-color:'.($o?$o:'yellow')],$p),
    'tn'=>tag('a',['href'=>'#fn'.$p,'id'=>'tn'.$p],'['.$p.']'),
    'fn'=>tag('a',['href'=>'#tn'.$p,'id'=>'fn'.$p],'['.$p.']'),
    'console'=>div($d,'console'),
    'md'=>conns::md($da),
    'pre'=>tagb('pre',$d),
    'ko'=>tagb('pre',$da),
    'no'=>'',
    default=>''};
if(!$ret)$ret=$da; $no=str_contains($da,'<')?1:0;
if(method_exists('conns',$c))return conns::$c($p,$o);
if(isimg($p) && !$no)return tagb('figure',img(imgroot($p)).($o?tagb('figcaption',$o):''));
if(strpos($d,'://') && !$no){$ret=conns::lnk($p,$o); if($ret)return $ret;}
if(in_array($c,self::$cn))return tag($c,'',$d);//html
if(self::$cb[$c]??'')return tag(self::$cb[$c],'',$d);
return $ret;}

static function build($p){
[$d,$m,$id,$prs,$nop]=vals($p,['txt','m','id','parser','nop']);
$d=self::parser($d,[$m,$id],$prs?$prs:'conn::connectors');
if(!$nop)$d=self::embed_p($d);
if(!$nop)$d=nl2br($d);
return $d;}

static function call($p){
$j='cnn|conn,build||txt';
$bt=bj($j,ico('ok'));
$ret=conns::btedt(['id'=>'txt','bt'=>$bt]);
$js=atj('bjcall',$j);
$ret.=textarea('txt','',64,12,['class'=>'console','onchange'=>$js,'onclick'=>$js,'onkeyup'=>$js]);
return $ret.div('','area','cnn');}

}
?>